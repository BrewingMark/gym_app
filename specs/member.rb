require("minitest/autorun")
require('minitest/reporters')
require_relative('../models/member')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class MemberTest < Minitest::Test

  def setup()
    @member1 = Member.new({'name' => "Joe Smith",
                           'date_of_birth' => 22/03/1998,
                           'membership' => "Premium"})
  end

  def test_member_has_name()
    assert_equal("Joe Smith", @member1.name)
  end

  def test_member_date_of_birth()
    assert_equal(22/03/1998, @member1.date_of_birth)
  end

  def test_member_membership()
    assert_equal("Premium", @member1.membership)
  end


end
