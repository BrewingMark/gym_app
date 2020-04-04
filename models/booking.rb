require_relative('../db/sql_runner')

class Booking

  attr_accessor :member_id, :fitness_class_id
  attr_reader :id

  def initialize(options)
    @id = options['id']
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

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
