# Boolean Assertions

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters::use!

class BooleanTest < MiniTest::Test
  def setup
    @value = 1
    @value2 = 2
  end

  def test_
    assert(true, @value.odd?)
  end
end