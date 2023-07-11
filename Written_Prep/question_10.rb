# What is `yield` in Ruby and how does it work?

=begin
In Ruby, `yield` is a keyword and using it is one of the ways in which we
execute blocks. `yield` is used within a method definition, allowing that
method to execute the block that is being passed in. This allows us to inject
additional code into the method without modifying the method implementation.
`yield` can also accepts arguments, allowing us to work with block parameters
and local block variables within our block.
=end