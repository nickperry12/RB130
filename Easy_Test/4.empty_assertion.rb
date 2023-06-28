require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class Empty < MiniTest::Test
  def setup
    @array = []
  end

  def test_empty
    assert_empty(@array)
  end
end