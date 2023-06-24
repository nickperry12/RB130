# each_with_object

# The Enumerable#each_with_object method iterates over the members of a
# collection, passing each element and an arbitrary object (usually a
# collection) to the associated block. The value returned by the block is not
# used. The object that is passed to the block is defined as an argument to
# each_with_object; with each iteration, this object may be updated by the
# block. When iteration is complete, the final value of the object is returned.

# Write a method called each_with_object that behaves similarly for Arrays. It
# should take an Array and an object of some sort as an argument, and a block.
# It should yield each element and the object to the block. each_with_object
# should return the final value of the object.

# If the Array is empty, each_with_object should return the original object
# passed as its second argument.

# Your method may use #each, #each_with_index, #inject, loop, for, while, or
# until to iterate through the Array passed in as an argument, but must not use
# any other methods that iterate through an Array or any other collection.

=begin
P:

Write a method `each_with_object` that behaves similarily to
`Enumerable#each_with_object` and takes two arguments:

1. An array
2. An object to be manipulated (usually a collection)

The method should return the original object passed in as the second argument

A:

Iterate through the given array
- Yield each element from the array, and the given object (second arg)
- The object will be updated on each iteration depending on what happens within
  the block

Return the second object

=end

def each_with_object(arr, obj)
  arr.each do |item|
    yield(item, obj)
  end

  obj
end

# Examples

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}