require 'minitest/autorun'

# You can also create a new Exception Class the following way:
# class NoExperienceError < StandardError
# end

NoExperienceError = Class.new(StandardError)

class Employee
  attr_accessor :name, :experience

  def initialize(name, experience = "")
    @name = name
    @experience = experience
  end

  def hire
    raise NoExperienceError, 'Have no experience' if experience.empty?
  end
end

class EmployeeTest < MiniTest::Test
  def setup
    @bob = Employee.new("Robert", "")
  end

  def test_hire
    assert_raises(NoExperienceError) { @bob.hire }
  end
end
