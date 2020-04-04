require_relative('../db/sql_runner')


class FitnessClass

  attr_accessor :name, :class_day, :start_time, :end_time
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @class_day = options['class_day']
    @start_time = options['start_time']
    @end_time = options['end_time']
    @id = options['id']
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

end
