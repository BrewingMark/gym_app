require_relative( "../models/member.rb" )
require_relative( "../models/fitness_class.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

Member.delete_all()

member1 = Member.new({
  'name' => "Joe Smith",
  'age' => 22,
  'membership' => "Premium"
  })
member1.save()
member2 = Member.new({
  'name' => "Jane Jeffries",
  'age' => 28,
  'membership' => "Standard"
  })
member2.save()
member3 = Member.new({
  'name' => "Fraser Taylor",
  'age' => 29,
  'membership' => "Standard"
  })
member3.save()
member4 = Member.new({
  'name' => "Mike Brewer",
  'age' => 48,
  'membership' => "Premium"
  })
member4.save()
member5 = Member.new({
  'name' => "Fraser Taylor",
  'age' => 48,
  'membership' => "Premium"
  })
member5.save()

fitness_class1 = FitnessClass.new({'name' => "Super Spin",
                   'class_day' => "Monday",
                   'start_time' => "07:00",
                   'end_time' => "07:45"})
fitness_class1.save()


binding.pry
nil
