# How do methods access both implicit and explicit blocks passed in?

=begin
Methods access implicit blocks by using the `yield` keyword within the method
definition. When a block is passed into the method as an argument, the `yield`
keyword is what's used to execute the code. Without `yield` in the method
definition, the block will not be executed. We must also make sure to pass in
a block if we have `yield` within the method. If no block is passed in, a
`LocalJumpError` will be raised.

Methods access explicit blocks by prepending the unary `&` operator to the
parameter name. The unary `&` operator converts the block being passed in to
a "simple" `Proc` object. Using explicit blocks provides additional flexbility,
as we can now have a variable that represents the block, which we can then use
to pass the block to another method. Within the method, instead of using the
`yield` key word, we use the `Proc#call` method on what is now a `Proc` object
being passed into the method.
=end
