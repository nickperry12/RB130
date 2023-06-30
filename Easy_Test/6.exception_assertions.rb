# Exception Assertions

# Write a minitest assertion that will fail unless employee.hire raises a
# NoExperienceError exception.

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class Employee < StandardError
  def hire
    raise("NoExperienceError")
  end
end

class EmployeeTest < MiniTest::Test
  attr_reader :employee
  def setup
    @employee = Employee.new
  end

  def test_hire
    assert_raises('NoExperienceError') { employee.hire }
  end
end