# How do we fix the following code so the output is `true`? Explain.

def some_method(block)
  block_given? # we want this to return `true`
end

bloc = proc { puts "hi" } # do not alter this code

p some_method(bloc) { "this is a block" }

=begin
To fix this code, we can pass a block into the method as seen on line 9. The
`#block_given?` method will check to see if a block is being passed in, and if
a block is provided, will return `true`. 
=end
