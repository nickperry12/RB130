# Zipper

# The Array#zip method takes two arrays, and combines them into a single array
# in which each element is a two-element array where the first element is a
# value from one array, and the second element is a value from the second array,
# in order. For example:

# Example

# [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Write your own version of zip that does the same type of operation. It should
# take two Arrays as arguments, and return a new Array (the original Arrays
# should not be changed). Do not use the built-in Array#zip method. You may
# assume that both input arrays have the same number of elements.

=begin
P:

Write a method `zip` that functions similarily to the `Array#zip` method. The
method should take two arrays as an argument, and creates subarrays that combine
the elements at the same index position.

Modeling:

I: [1, 2, 3], [4, 5, 6] O: [[1, 4], [2, 5], [3, 6]]

Initialize `counter` to 0 Initialize `result` to [] Initialize `subarr` to
[arr1[counter], arr2[counter] Push `subarr` into `result` Repeat until `counter`
is > arr1.size

=end

def zip(arr1, arr2)
  counter = 0
  result = []

  while counter < arr1.size
    subarr = [arr1[counter], arr2[counter]]
    result << subarr
    counter += 1
  end

  result
end


# Example

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]