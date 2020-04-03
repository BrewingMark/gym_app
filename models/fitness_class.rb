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

end
