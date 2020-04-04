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

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run(sql)
    return results. map {|member| Member.new(member)}
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def self.find(name)
    sql = "SELECT * FROM members WHERE name = $1"
    values = [name]
    members = SqlRunner.run(sql, values)
    return members.map {|member| Member.new(member)}
  end
  # change to search by name returning all members with a perticular name.

end
