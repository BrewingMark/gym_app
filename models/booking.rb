require_relative('../db/sql_runner')

class Booking

  attr_reader :id, :member_id, :fitness_class_id

  def initialize(options)
    @id = options['id']
    @member_id = options['member_id']
    @fitness_class_id = options['fitness_class_id']
  end

end
