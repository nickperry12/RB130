# Included Object Assertions

# Write a minitest assertion that will fail if the 'xyz' is not in the Array
# list.

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class Included < MiniTest::Test
  def setup
    @array = ['xyz', 'zzz', 'abc']
  end

  def test_included
    assert_includes(@array, 'xyz')
  end
end