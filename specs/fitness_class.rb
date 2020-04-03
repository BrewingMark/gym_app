require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/fitness_class')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class FitnessClassTest < Minitest::Test

  def setup()
    @fitness_class1 = ({'name' => "Super Spin",
                        'class_date' => ,
                        'start_time' => ,
                        'end_time' => })
  end

end
