# What will be output if we add the follow code to the code above? Why?

def block_method(animal)
  yield(animal)
end

block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

block_method('turtle') { puts "This is a #{animal}."}

=begin
Line 11 will raise a `NoNameError`. This occurs for various reasons - there is
no local variable `animal` initialized in the main scope, and there is no local
block variable initialized within the block. However, the biggest issue is that
we don't have an `animal` parameter defined between two `|`'s. When we place a
parameter name between two `|`'s we're creating a local block parameter. Objects
passed into the block get initialized to this parameter name creating a local
block variable that we can use within the block. But because of the absence of a
block parameter, an error is raised.
=end