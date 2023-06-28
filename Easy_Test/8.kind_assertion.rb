# Kind Assertions

# Write a minitest assertion that will fail if the class of value is not Numeric
# or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class KindTest < MiniTest::Test
  def setup
    @value = Numeric.new
    @value2 = 1
    @value3 = 1.0
  end

  def test_kind_of
    assert_kind_of(Numeric, @value)
    assert_kind_of(Numeric, @value2)
    assert_kind_of(Numeric, @value3)
  end
end