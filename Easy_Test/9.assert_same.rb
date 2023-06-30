# Same Object Assertions

# Write a test that will fail if list and the return value of list.process are
# different objects.

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class ObjectTest < MiniTest::Test
  def setup
    @value = "hello"
    @value2 = @value
  end

  def test_same_object
    assert_same(@value2, @value)
  end
end