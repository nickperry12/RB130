# map

# Let's return to implementing existing core ruby methods to learn about blocks.

# The Enumerable#map method iterates over the members of a collection, using the
# associated block to perform some sort of operation on each collection member.
# The returned values from the block are then built up into an Array that is
# then returned to the caller. Note in particular that every time #map yields to
# the block, it obtains just one value. That value may be a complex value - it
# may even be another collection - but it is nevertheless just one value. Thus,
# #map returns an Array that has the same number of elements that the original
# collection had.

# Write a method called map that behaves similarly for Arrays. It should take an
# Array as an argument, and a block. It should return a new Array that contains
# the return values produced by the block for each element of the original
# Array.

# If the Array is empty, map should return an empty Array, regardless of how the
# block is defined.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
# for, while, or until to iterate through the Array passed in as an argument,
# but must not use any other methods that iterate through an Array or any other
# collection.

=begin
P:

Write a method `map` that functions similarily to `Enumerable#map`. The method
will take an array as an argument, and return a new array filled with the same
number of elements. Each element will represent the return value of each block
iteration.

If the given array is empty, it should return an empty array

A:

/* given an array `arr` */

Initialize `new_arr` to an empty array

Iterate through `arr` Yield each element into the block
- Push the return value of the block into `new_arr`

Return `new_arr`
=end

def map(arr)
  new_arr = []
  arr.each { |obj| new_arr << yield(obj) }
  new_arr
end


# Examples

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]