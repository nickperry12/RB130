# each_cons (Part 1)

# The Enumerable#each_cons method iterates over the members of a collection
# taking each sequence of n consecutive elements at a time and passing them to
# the associated block for processing. It then returns a value of nil.

# Write a method called each_cons that behaves similarly for Arrays, taking the
# elements 2 at a time. The method should take an Array as an argument, and a
# block. It should yield each consecutive pair of elements to the block, and
# return nil.

# Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
# for, while, or until to iterate through the Array passed in as an argument,
# but must not use any other methods that iterate through an Array or any other
# collection.

=begin
P:

Write a method `each_cons` that iterates through the elements of an array and
yield consecutive pairs of elements, replacing the current element on iteration
with that pair. The method should return `nil`

A:

/* given a collection `obj` */

Iterate through and transfrom the elements of `obj`
- Yield `arr[i]`, `arr[ii]` into the block
- Transform the current element to the return value of the block

Return `nil`
=end

def each_cons(obj)
  obj.each_index do |idx|
    break if obj[idx + 1] == nil
    yield(obj[idx], obj[idx + 1])
  end

  nil
end


# Examples

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil