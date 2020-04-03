class Member

  attr_accessor :name, :date_of_birth, :membership
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @date_of_birth =options['date_of_birth']
    @membership = options['membership']
    @id = options['id'].to_i
  end

end
