# Perfect Number  

# The Greek mathematician Nicomachus devised a classification scheme for natural
# numbers (1, 2, 3, ...), identifying each as belonging uniquely to the
# categories of abundant, perfect, or deficient based on a comparison between
# the number and the sum of its positive divisors (the numbers that can be
# evenly divided into the target number with no remainder, excluding the number
# itself). For instance, the positive divisors of 15 are 1, 3, and 5. This sum
# is known as the Aliquot sum.

# Perfect numbers have an Aliquot sum that is equal to the original number.
# Abundant numbers have an Aliquot sum that is greater than the original number.
# Deficient numbers have an Aliquot sum that is less than the original number.
# Examples:

# 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.

# 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4
# + 7 + 14 = 28.

# 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9
# which is less than 15.

# 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1
# + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.

# Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

# Write a program that can tell whether a number is perfect, abundant, or
# deficient.

=begin
P:

Need to write a program that takes a given number, and classifies it as either
perfect, abundant or deficient. 

A perfect number is classified as a number in which the sum of it's divisors are
equal to the number itself.

A deficient number is a number in which the sum of it's divisors are less than
the number itself.

An abundant number is a number in which the sum of it's divisors are greater
than the number itself.

E:

See `perfect_number_test.rb` for test cases

D:

`Range` object to iterate through numbers

Modeling/Algorithm:

Initialize `divisors` to an empty list

Iterate through a non-inclusive range from 1 to the given number
  - If the `num` is evenly divisible by the current number, add that number to
    `divisors`

Find the sum of divisors
  - Classify the number based off the given rules
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    sum = self.find_sum_of_divisors(number)

    case
    when sum == number then "perfect"
    when sum > number then "abundant"
    when sum < number then "deficient"
    end
  end

  class << self

    private

    def find_sum_of_divisors(number)
      (1...number).select { |num| number % num == 0 }.sum
    end
  end
end
