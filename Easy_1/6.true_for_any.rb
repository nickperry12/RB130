# Iterators: True for Any?

# A great way to learn about blocks is to implement some of the core ruby
# methods that use blocks using your own code. Over this exercise and the next
# several exercises, we will do this for a variety of different standard
# methods.

# The Enumerable#any? method processes elements in a collection by passing each
# element value to a block that is provided in the method call. If the block
# returns a truthy value for any element, then #any? returns true. Otherwise,
# #any? returns false. Note in particular that #any? will stop searching the
# collection the first time the block returns true.
  
# Write a method called any? that behaves similarly for Arrays. It should take
# an Array as an argument, and a block. It should return true if the block
# returns true for any of the element values. Otherwise, it should return false.
  
# Your method should stop processing elements of the Array as soon as the block
# returns true.
  
# If the Array is empty, any? should return false, regardless of how the block
# is defined.
  
# Your method may not use any standard ruby method that is named all?, any?,
# none?, or one?.

=begin
P:

Need to write a method `any?` that functions like the `Array#any?` method. The
method should iterate over each element passed into the block, and if the block
evaluates to true on any iteration, it should exit the block and return true.
Otherwise it should return false.

Modeling:

Pass each argument of the array into the block

Initialize `counter` to 0
Use a `while` loop
While `counter` < size of array
Yield arr[counter] to the block
If the block returns a truthy value => break and return true
=end

def any?(arr)
  counter = 0

  while counter < arr.size
    if yield(arr[counter])
      return true
    end
    counter += 1
  end

  false
end

# Examples 

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false