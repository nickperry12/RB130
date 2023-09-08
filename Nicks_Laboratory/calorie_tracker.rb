# Write a test suite using MiniTest for the CalorieTracker class below. For now,
# the test suite should contain one test that verifies a new CalorieTracker
# instance with no passed arguments has a default value of 0 for current
# calories and 2000 for the calorie goal. You can assume that the file will be
# placed in the same directory as calorie_tracker.rb.

# calorie_tracker.rb

class CalorieTracker
  attr_reader :current, :goal

  def initialize(goal = 2000)
    @current = 0
    @goal = goal
  end

  def add(amount)
    @current += amount
  end

  def burn(amount)
    @current -= amount
  end

  def met_goal?
    @current >= @goal
  end
end