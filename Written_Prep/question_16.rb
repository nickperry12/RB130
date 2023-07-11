# What does `&` do when in used the method parameter?

=begin
When the unary `&` operator is prepended to a parameter name, it will take the
block that is being passed into the method and convert it to a simple `Proc`
object. This is known as an explicit block parameter.
=end

def method(&var); end
