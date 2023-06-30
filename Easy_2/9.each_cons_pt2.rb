# each_cons (Part 2)

# In the previous exercise, we wrote a method that emulates
# Enumerable#each_cons, but limited our method to handling 2 elements at a time.
# Enumerable#each_cons can actually handle any number of elements at a time: 1,
# 2, 3, or more.

# Update your each_cons method so it takes an argument that specifies how many
# elements should be processed at a time.

# Your method may use #each, #each_index, #each_with_object, #inject, loop, for,
# while, or until to iterate through the Array passed in as an argument, but
# must not use any other methods that iterate through an Array or any other
# collection.

=begin
P:

Need to update our `each_cons` method so that it takes a second argument, an
integer, that dictates how many consecutive elements are passed into the block.

A:

/* given an array `arr` and an `n` */

Iterate through the indices of `arr`
- Yield the current item to the bloc, followed by the next `n` amount of items
  - `n` is determined the second argument passed in

Return `nil`
=end

def each_cons(arr, n)
  arr.each_index do |i|
    break if i + n > arr.size
    yield(*arr[i..(i + n - 1)])
  end

  nil
end

# Examples

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}