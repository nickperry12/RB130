# Optional Blocks

# Write a method that takes an optional block. If the block is specified, the
# method should execute it, and return the value returned by the block. If no
# block is specified, the method should simply return the String 'Does not
# compute.'.

# Examples

# compute { 5 + 3 } == 8
# compute { 'a' + 'b' } == 'ab'
# compute == 'Does not compute.'

def compute(*arg)
  if block_given?
    if arg.length == 1
      yield(arg[0])
    else
      yield(arg)
    end
  else
    "Does not compute"
  end
end

p compute("hello", "!") { |str, str2| str + " world" + str2 }
p compute(10, 20) { |num, num2| num + num2 + 25 }
p compute(1, 2, 3, 4, 5) { |arr| arr.reduce(:+) }
p compute

# FE

# Modify the compute method so it takes a single argument and yields that
# argument to the block. Provide at least 3 examples of calling this new version
# of compute, including a no-block call.