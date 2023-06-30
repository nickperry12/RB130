# Nil Assertions

# Write a minitest assertion that will fail if value is not nil.

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class AssertNil < MiniTest::Test
  def setup
    @value = nil
  end

  def test_nil
    assert_nil(@value)
  end
end