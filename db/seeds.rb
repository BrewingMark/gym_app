require_relative( "../models/member.rb" )
require_relative( "../models/fitness_class.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

member1 = Member.new({
  'name' => "Joe Smith",
  'age' => 22,
  'membership' => "Premium"
  })
# member1.save()
member2 = Member.new({
  'name' => "Jane Jeffries",
  'age' => 28,
  'membership' => "Standard"
  })
member2.save()



binding.pry
nil
