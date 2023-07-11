# What will the method call call_me output? Why?

def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)

=begin
The `call_me` method will output the string "hi Griffin". When a new `Proc`
object is instantiated on line 8, it binds to all of the surrounding artifacts
such as method references, local variables, constants and other artifacts.
Because the `name` variable was initialized prior the instantiation of the
`Proc` object, it is apart of its binding.

Closures don't bind specfically to the object that the variable is initialized
to, but instead to the name of the variale itself. When the `name` variable is
reassigned on line 9, the change will also be reflected when we invoke the
`Proc`. This demonstrates that `Proc`s keep track of its surrounding context and
drags it around wherever the chunk of code is passed to.
=end