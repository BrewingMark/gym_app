require_relative('../db/sql_runner')

class Member

  attr_accessor :name, :age, :membership
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @age =options['age']
    @membership = options['membership']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO members (name, age, membership)
           VALUES ($1,$2,$3) RETURNING id"
     values = [@name, @age, @membership]
     results = SqlRunner.run(sql, values)
     @id = results.first()['id'].to_i
  end

end
