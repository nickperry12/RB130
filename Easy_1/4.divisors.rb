# Divisors

# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence you
# wish.

=begin
P:

Need to write a method that returns an array (order does not matter) of all the
numbers that are evenly divisible by the argument passed in.

Modeling:

I: 98
O: [1, 2, 7, 14, 49, 98]

range = (1..num)

convert range to array => select all nums that are evenly divisible => return
new array

A:

/* given a positive integer `int` */

Create a range of nums from 1 to `int`

Convert range to an array
- select all the ints from array that are evenly divisible by `int`
- return new array
=end

def divisors(int)
  arr = (1..Math.sqrt(int)).to_a
  arr.each_with_object(result = []) do |num, result|
    if int % num == 0
      result.push(num, int / num)
    end
  end

  result.sort.uniq
end

# Examples

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
