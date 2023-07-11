# What does `&` do when in a method invocation argument?

=begin
When the unary `&` operator is prepended to an argument being passed into a
method, Ruby will try and convert the object to a block, which is done easily if
the object being passed in is a `Proc` object. If the object is not a `Proc`,
then Ruby will attempt to convert it to a `Proc` by calling the `Symbol#to_proc`
method on the object. If Ruby is successful in converting the object to a
`Proc`, it can then convert the `Proc` into a block.
=end

method(&var)