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

end
