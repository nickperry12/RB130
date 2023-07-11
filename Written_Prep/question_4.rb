# How do blocks work?

=begin
Blocks contain chunks of code that can be passed into methods to execute. In
order for our method to execute the code within the block, we must use the
`yield` keyword within our method. When invoking the method, we must make sure
it's still accepting the same number of arguments as the number of parameters.
If we don't make sure of that, an `ArgumentError` will be thrown.
=end

def some_method
  puts "hello"
  yield
end

some_method { puts "hi" }