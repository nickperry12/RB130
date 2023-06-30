# max_by

# The Enumerable#max_by method iterates over the members of a collection,
# passing each element to the associated block. It then returns the element for
# which the block returned the largest value.

# Write a method called max_by that behaves similarly for Arrays. It should take
# an Array and a block, and return the element that contains the largest value.

# If the Array is empty, max_by should return nil.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
# for, while, or until to iterate through the Array passed in as an argument,
# but must not use any other methods that iterate through an Array or any other
# collection.

=begin
P:

Write a method `max_by` that functions similarily to the `Enumerable#max_by`
method. The method should take an array as an argument, and should iterate 
through the array yielding each object to the block. It should then return the
element for which the block returned the largest value.

Modeling:

I: [1, 5, 3]
Block: { value + 2 }
O: 5

initialize idx_of_max to 0
initialize current_max to 0

iterate through array => yield item to block => if current block iteration is
greater than current_max => reassign idx_of_max to current idx on iteration

Return the value at idx_of_max

=end

def max_by(arr)
  max = arr[0]

  arr.each do |item|
    max = item if yield(item) > yield(max)
  end

  max
end

# Examples

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil