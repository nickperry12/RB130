# Find Missing Numbers

# Write a method that takes a sorted array of integers as an argument, and
# returns an array that includes all of the missing integers (in order) between
# the first and last elements of the argument.

=begin
P:

Must define a method that takes an array of integers (sorted), and returns an
array with all the missing numbers.

Rules:

Doesn't look like the method requires a block, judging by the test cases.

Modeling:

I: [-3, -2, 1, 5]
O: [-1, 0, 2, 3, 4]

range_start = arr[0]
range_end = arr[-1]

(range_start..range_end) => iterate through range => if number on iteration is
not included in `arr`, push number into `result` array => return `result`

A:

/* given a sorted array `arr` */

Initialize `range_start` to the first element of `arr`
Initialize `range_end` to the last element of `arr`
Initialize `result` to empty array

Iterate through a range (range_start..range_end) exclusive
- If the current number on iteration is not included in `arr`
  - Push number into `result`

Return `result`

=end

def missing(arr)
  range_start = arr[0]
  range_end = arr[-1]
  result = []

  (range_start..range_end).each { |num| result << num if !arr.include?(num) }

  result
end

# Examples

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []