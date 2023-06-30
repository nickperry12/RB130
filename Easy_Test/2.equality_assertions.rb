# Equality Assertions

# Write a minitest assertion that will fail if value.downcase does not return
# 'xyz'.

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class Assertion < MiniTest::Test
  def setup
    @string = 'XYZ'
  end

  def test_downcase
    assert_equal('xyz', @string.downcase)
  end
end