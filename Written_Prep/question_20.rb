# How do we invoke an explicit block passed into a method using &? Provide
# example.

=begin
To invoke an explicit block, we use the `Proc#call` method. We use this because
the unary `&` operator converts the block to a simple `Proc` object. 
=end

def some_method(&block)
  block.call
end

some_method { puts "hello" }