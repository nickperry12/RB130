# Refutations

# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class TestIncludes < MiniTest::Test
  def setup
    @list = ['abc', 'hello']
  end

  def test_list_includes
    refute_includes(@list, 'xyz', "It's included!")
  end
end