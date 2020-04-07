require_relative('../db/sql_runner')

class Booking

  attr_accessor :member_id, :fitness_class_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id']
    @fitness_class_id = options['fitness_class_id']
  end

  def save()
    sql = "INSERT INTO bookings(member_id, fitness_class_id)
    VALUES ($1, $2) RETURNING id"
    values = [@member_id, @fitness_class_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
    return results. map {|booking| Booking.new(booking)}
  end

  def self.delete(id)
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE bookings SET (member_id, fitness_class_id) = ($1, $2) WHERE id = $3"
    values = [@member_id, @fitness_class_id, @id]
    SqlRunner.run(sql, values)
  end

  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def fitness_class()
    sql = "SELECT * FROM fitness_classes
    WHERE id = $1"
    values = [@fitness_class_id]
    results = SqlRunner.run( sql, values )
    return FitnessClass.new( results.first )
  end

end
