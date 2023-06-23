# From-To-Step Sequence Generator

# The Range#step method lets you iterate over a range of values where each value
# in the iteration is the previous value plus a "step" value. It returns the
# original range.

# Write a method that does the same thing as Range#step, but does not operate on
# a range. Instead, your method should take 3 arguments: the starting value, the
# ending value, and the step value to be applied to each iteration. Your method
# should also take a block to which it will yield (or call) successive iteration
# values.

=begin
P:

Write a method #step that accepts 3 arguments:

1. the starting value
2. the ending value
3. the step value to be applied to each iteration

Method should also take a block to which it will call successive iteration
values

Modeling:

Initialize following local vars:

start_val = 1
end_val = 10
step_val = 3

Until start_val == end_val

yield start_val to the block, and on each block iteration, increment start_val
by step_val

A:

/* given 3 integers `start_val`, `end_val`, `step_val` */

Initialize 3 local vars to the parameters
- `start_val` = `start_val`
- `end_val` = `end_val`
- `step_val` = `step_val`

Until `start_val` is equal to `end_val`
- Yield `start_val` to the block
  - On each iteration, increment `start_val` by `step_val`

Return `start_val` after each iteration


=end

def step(start, final, step)
  start_val = start
  end_val = final
  step_val = step

  until start_val > end_val
    yield(start_val)
    start_val += step_val
  end

  start_val
end

# Example

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

# What do you think would be a good return value for this method, and why?