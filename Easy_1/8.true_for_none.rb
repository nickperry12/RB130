# # Iterators: True for none?

# In the previous two exercises, you developed methods called any? and all? that
# are similar to the standard Enumerable methods with the same names. In this
# exercise, you will develop another of the methods in this family, none?.

# Enumerable#none? processes elements in a collection by passing each element
# value to a block that is provided in the method call. If the block returns
# true for any element, then #none? returns false. Otherwise, #none? returns
# true. Note in particular that #none? will stop searching the collection the
# first time the block returns true.

# Write a method called none? that behaves similarly for Arrays. It should take
# an Array as an argument, and a block. It should return true if the block
# returns false for all of the element values. Otherwise, it should return
# false.

# Your method should stop processing elements of the Array as soon as the block
# returns true.

# If the Array is empty, none? should return true, regardless of how the block
# is defined.

# Your method may not use any of the following methods from the Array and
# Enumerable classes: all?, any?, none?, one?. You may, however, use either of
# the methods created in the previous two exercises.

=begin
P:

Need to write a method `none?` that functions similarily to the
`Enumberable#none?` method. The method should iterate through the collection
that is being passed in, which each object in the collection being passed into
the block. If the block returns `true`, iteration should stop and the method
return `false`. If all iterations of the block return `false`, the method should
return `true`.

A:

/* given an array `arr` */

Iterate through the given array
- Yield each object to the block
  - If the block iteration returns `true`
    - Break out of the iteration and return `false`
  - If each iteration returns `false`, the method should return `true`
=end

def none?(arr)
  arr.each { |obj| return false if yield(obj) }
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true