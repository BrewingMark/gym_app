class Member

  attr_accessor :name, :age, :membership
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @age =options['age']
    @membership = options['membership']
    @id = options['id'].to_i
  end

end
