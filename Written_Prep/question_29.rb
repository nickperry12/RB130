# Why does the following code output `false`?

def some_method(&block)
  block_given?
end

bloc = proc { puts "hi" }

p some_method(&bloc)

=begin
The following code outputs false because the `#block_given?` method checks to
see if a block is being passed to the method as an argument, and will return
`true` or `false` depending on if it a block is passed in or not. In this case,
there is no blocking being passed in; instead a `Proc` object is passed into the
method. We can remedy this by passing in an implicit block with either `{}`, or
`do..end`, or we could use an implict block, and prepend the `bloc` variable
with a unary `&` operator, which converts the `Proc` object to a block (going
this route would also require either removing the parameter in the `some_method`
definition or prepending the parameter with a unary `&` operator as well).
=end