require_relative('../db/sql_runner')


class FitnessClass

  attr_accessor :name, :class_day, :start_time, :end_time
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @class_day = options['class_day']
    @start_time = options['start_time']
    @end_time = options['end_time']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO fitness_classes (name, class_day, start_time, end_time)
           VALUES ($1,$2,$3,$4) RETURNING id"
    values = [@name, @class_day, @start_time, @end_time]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM fitness_classes"
    results = SqlRunner.run(sql)
    return results. map {|fitness_class| FitnessClass.new(fitness_class)}
  end

  def self.delete_all()
    sql = "DELETE FROM fitness_classes"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM fitness_classes WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE fitness_classes SET (name, class_day, start_time, end_time) =
          ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @class_day, @start_time, @end_time ,@id]
    SqlRunner.run(sql, values)
  end

  def self.search_by_name(name)
    sql = "SELECT * FROM fitness_classes WHERE name = $1"
    values = [name]
    results = SqlRunner.run(sql, values)
    return results.map {|fitness_class| FitnessClass.new(fitness_class)}
  end

  def members_attending()
    sql = "SELECT members.* FROM members
    INNER JOIN bookings ON bookings.member_id = members.id
    WHERE bookings.fitness_class_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def self.find(id)
    sql = "SELECT * FROM fitness_classes
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return FitnessClass.new( results.first )
  end

end
