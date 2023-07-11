# Sum of Multiples

# Write a program that, given a natural number and a set of one or more other
# numbers, can find the sum of all the multiples of the numbers in the set that
# are less than the first number. If the set of numbers is not given, use a
# default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 20
# that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18.
# The sum of these multiples is 78.

=begin

P:

Need to write a program that, when provided a set of numbers and a target
number, finds the multiples of each number in the set and returns the sum. If
no set of numbers is provided, then use a default set of 3 and 5.

E:

See `sum_of_multiples_test.rb` for test cases

D:

Range to iterate through
Array to store set of numbers

Algorith/Modeling:

We can see from the test cases that there are two different methods we need to
define in our class. We need a class method `to` and a instance method `to`. 

If the set of numbers is not provided, we need to use the class method.

If the set of numbers is provided, we need to use the instance method.

Both methods can use the following algorithm:

Iterate through range of nums from 1..given int
  - iterate through set of nums
    - If the current int can be evenly divided by the current num
      - Add number to `total`

Return `total`
=end

class SumOfMultiples
  def initialize(*nums)
    @list_of_nums = nums.empty? ? [3, 5] : nums
  end

  def self.to(int)
    self.new.to(int)
  end

  def to(int)
    multiples = []
    (1...int).each do |i|
      list_of_nums.each do |ii|
        if i % ii == 0
          multiples << i unless multiples.include?(i)
        end
      end
    end

    multiples.sum
  end

  private

  attr_reader :list_of_nums
end
