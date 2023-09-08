# Write a test suite using MiniTest for the CalorieTracker class below. For now,
# the test suite should contain one test that verifies a new CalorieTracker
# instance with no passed arguments has a default value of 0 for current
# calories and 2000 for the calorie goal. You can assume that the file will be
# placed in the same directory as calorie_tracker.rb.

# Write another test that verifies a custom calorie goal can be passed when
# initializing a CalorieTracker instance. Explain, with specific reference to
# the constructs in your submitted code, how the test is determined to pass or
# fail.

# ---------------------------

# Write two more tests:

# The first test should verify that the add instance method is working
# appropriately. The second test should verify that the same add method will
# raise an error if invoked without arguments.

require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'calorie_tracker'
MiniTest::Reporters.use!

class CalorieTrackerTest < MiniTest::Test
  def setup
    @tracker = CalorieTracker.new
  end

  def test_default_values
    goal = 2000
    current = 0
    assert_equal(current, CalorieTracker.new.current)
    assert_equal(goal, CalorieTracker.new.goal)
  end

  def test_initialize
    goal = 3000
    tracker = CalorieTracker.new(3000)
    assert_equal(goal, tracker.goal)
  end

  def test_current
    expected = 0
    assert_equal(expected, @tracker.current)
  end

  def test_goal
    expected = 2000
    assert_equal(expected, @tracker.goal)
  end

  def test_add
    total = 200
    @tracker.add(200)
    assert_equal(total, @tracker.current)
  end

  def test_add_raise_error
    assert_raises(ArgumentError) { @tracker.add }
  end

  def test_burn
    @tracker.add(600)
    current_after_burned = 300
    @tracker.burn(300)
    assert_equal(current_after_burned, @tracker.current)
  end

  def test_met_goal
    @tracker.add(2000)
    assert(@tracker.met_goal?)
  end

  def test_refute_met_goal
    @tracker.add(1500)
    refute(@tracker.met_goal?)
  end
end