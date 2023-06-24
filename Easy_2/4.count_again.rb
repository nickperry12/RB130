# drop_while

# The Enumerable#drop_while method begins by iterating over the members of a
# collection, passing each element to the associated block until it finds an
# element for which the block returns false or nil. It then converts the
# remaining elements of the collection (including the element that resulted in a
# falsey return) to an Array, and returns the result.

# Write a method called drop_while that behaves similarly for Arrays. It should
# take an Array as an argument, and a block. It should return all the elements
# of the Array, except those elements at the beginning of the Array that produce
# a truthy value when passed to the block.

# If the Array is empty, or if the block returns a truthy value for every
# element, drop_while should return an empty Array.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
# for, while, or until to iterate through the Array passed in as an argument,
# but must not use any other methods that iterate through an Array or any other
# collection.

=begin
P:

Write a method `drop_while` that functions similarily to
`Enumerable#drop_while`. The method should take an array as an argument, and
return a new array containing the elements that returned a falsey value when
passed into the block.

A:

Initialize `current_idx` to 0
Iterate through the given array
- Yield each object to the block
  - If the block returns true, increment `current_idx` by 1
  - If the block returns false, stop iteration and add the elements from
    `current_idx` to the last idx to a new array

Return the new array
=end

def drop_while(arr)
  current_idx = 0
  new_arr = []

  arr.each do |obj|
    current_idx += 1 if yield(obj)
    if !yield(obj)
      new_arr = arr[current_idx..-1]
      break
    end
  end

  new_arr
end

# Examples

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? }  == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false }  == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []