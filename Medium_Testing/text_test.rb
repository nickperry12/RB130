require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @text = File.open('sample_text.txt', "r")
  end

  def test_swap
    lines = @text.read
    text_to_swap = Text.new(lines)
    new_lines = lines.gsub("a", "b")
    assert_equal(new_lines, text_to_swap.swap("a", "b"))
  end

  def test_text_count
    words = @text.read
    new_text = Text.new(words)
    word_count = words.split.count
    assert_equal(word_count, new_text.word_count)
  end

  def teardown
    @text.close
  end
end