require_relative('../db/sql_runner')

class Member

  attr_accessor :name, :age, :membership
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @age =options['age']
    @membership = options['membership']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO members (name, age, membership)
           VALUES ($1,$2,$3) RETURNING id"
     values = [@name, @age, @membership]
     results = SqlRunner.run(sql, values)
     @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE members SET (name, age, membership) = ($1, $2, $3) WHERE id = $4"
    values = [@name, @age, @membership, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
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

  def self.search_by_name(name)
    sql = "SELECT * FROM members WHERE name = $1"
    values = [name]
    members = SqlRunner.run(sql, values)
    return members.map {|member| Member.new(member)}
  end

  def self.find(id)
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

end
