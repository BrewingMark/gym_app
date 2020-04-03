require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/fitness_class')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class FitnessClassTest < Minitest::Test

  def setup()
    @fitness_class1 = FitnessClass.new({'name' => "Super Spin",
                        'class_day' => "Wednesday",
                        'start_time' =>  "07:00",
                        'end_time' => "07:45"})
  end

  def test_fitness_class_name()
    assert_equal("Super Spin", @fitness_class1.name)
  end

  def test_fitness_class_day()
    assert_equal("Wednesday", @fitness_class1.class_day)
  end

  def test_fitness_class_start_time()
    assert_equal("07:00", @fitness_class1.start_time)
  end

  def test_fitness_class_end_time()
    assert_equal("07:45", @fitness_class1.end_time)
  end

end
