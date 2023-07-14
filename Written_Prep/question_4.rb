# How do blocks work?

=begin
Blocks contain chunks of code that can be passed into methods as arguments to
execute. Blocks can be passed into a method either implicitly or explicitly.
To pass a block in implicitly, we can either us a curly braced block `{}`, or
a `do..end` block. Within the method definition, we must use the keyword `yield`
to execute the block.

To pass a block in explicity, we prepend the method parameter with a unary `&`
operator. This converts the passed in block into a "simple" `Proc` object, which
we can then save to a variable. We can then either use the `Proc#call` method on
the `Proc` or pass the it into another method to execute from there.

=end

def some_method
  puts "hello"
  yield
end

some_method { puts "hi" }