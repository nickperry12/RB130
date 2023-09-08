# Bubble Sort with Blocks

# In an earlier exercise, you were asked to construct a #bubble_sort! method
# that used the bubble sort algorithm to sort Arrays in place. Our solution was
# this:

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
# end

# The problem with this solution is that it doesn't give you any freedom in
# terms of the criteria used for the sort. For example, perhaps you want to sort
# the Array in reverse order from usual, or perhaps you want to sort a list of
# names in a case-insensitive manner.

# Your task in this assignment is to modify #bubble_sort! so it takes an
# optional block that determines which of two consecutive elements will appear
# first in the results.

# If you still have a copy of your #bubble_sort! method, you may use that method
# as the basis for this exercise. Otherwise, you can use the above solution.

=begin
P:

We need to modify our `bubble_sort!` method so it takes an optional block. If
the method does recieve a block, the block will determine which of the two
consecutive elements will appear first in the results. 

Example:

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
array == [14, 22, 12, 6, 27]

Modeling:

I: [6, 12, 27, 22, 14]
O: [14, 22, 12, 6, 27]

First iteration => [12, 6, 27, 22, 14]
Second iteration => [12, 6, 27, 22, 14]
Third iteration => [12, 6, 22, 27, 14]
Fourth iteration => [12, 6, 22, 14, 27]
Fifth iteration => [12, 6, 22, 14, 27]
Sixth iteration => [12, 22, 6, 14, 27]
Seventh iteration => [12, 22, 14, 6, 27]
Eighth iteration => [12, 22, 14, 6, 27]
Ninth iteration => [22, 12, 14, 6, 27]
Tenth iteration => [22, 14, 12, 6, 27]
Eleventh iteration => [22, 14, 12, 6, 27]
Twelvth iteartion => [22, 14, 12, 6, 27]
Thirteenth iteration => [22, 14, 12, 6, 27]
Fourteenth iteration => [14, 22, 12, 6, 27] 

Iteration completes because `arr` is now sorted

We know we have to yield the array to the block.
The block is determining how we're sorting the array.

In this case, we're sorting the array by comparing the result of modulo 7 on the
two consecutive elements.


=end

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index]
      end
      
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

# Examples:
array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]



array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)