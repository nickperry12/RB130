# Passing Parameters Part 2

# Ruby gives us a lot of flexibility when assigning arrays to variables. If we
# want to assign the entire array to a single variable, we can do that:

birds = %w(raven finch hawk eagle)
birds # => ['raven','finch','hawk','eagle']

# If we want to assign every element to a separate variable, we can do that too:

raven, finch, hawk, eagle = %w(raven finch hawk eagle)
raven # => 'raven'
finch # => 'finch'
hawk # => 'hawk'
eagle # => 'eagle'

# Suppose we want to organize our array contents into groups, where variables
# represent category names. Can we do that without extracting items directly
# from the array based on their indices?

# We can use the splat operator(*) to do something like this:

raven, finch, *raptors = %w(raven finch hawk eagle)
raven # => 'raven'
finch # => 'finch'
raptors  # => ['hawk','eagle']

# Based on the examples shown above, write a method that takes an array as an
# argument. The method should yield the contents of the array to a block, which
# should assign your block parameters in such a way that it ignores the first
# two elements, and groups all remaining elements as a raptors array.

=begin
P:

We're defining a method `group_birds` that takes an array as an argument, and
yields the elements of the array to a block. Doing so should assign our block
parameters in a way that the first two elements of the array are ignored, and
groups the remaining elements as a raptors array.
=end

def group_birds(birds)
  yield(birds)
end

group_birds(birds) { |_, _, *birds| puts "Raptors: #{birds.join(', ')}." }