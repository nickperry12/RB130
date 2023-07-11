# Why does the following code raise an error?

def some_method(block)
  block_given?
end

bl = { puts "hi" }

p some_method(bl)

=begin
This code snippet raises an error because we are trying to initialize a block
to a local variable `bl`. This is not possible in Ruby because blocks are not
objects that we can assign or store in a variable directly. Instead, we should
instantiate a new `Proc` object, which is another type of closure that we can
initialize to a variable we can pass into methods.
=end