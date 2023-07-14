# What will #p output below? Why is this the case and what is this code
# demonstrating?

def retained_array
  arr = []
  Proc.new do |el|
    arr << el
    arr
  end
end

arr = retained_array
arr.call('one')
arr.call('two')
p arr.call('three')

=begin
This code will output the following array:

`["one", "two", "three"]`

When a `Proc` object is instantiated within the `retained_array` method
definition, it creates a closure and binds to the surronding artifacts,
including the local method variable `arr`, which it can now drag around for
when the `Proc` gets executed at a later time. 

Because `retained_array` returns a `Proc` object (which it does because the
instantiation of the `Proc` is the last expression in the method definition),
we can invoke the `#call` method on the `retained_array` method, which has been
initialized to the local variable `arr`. The `Proc` object itself also returns
the last expression within it's block, which is it's own private copy of the
variable `arr`. When we invoke the `call` method and pass in each string as an
argument, it mutates the array that is stored within `arr`. 

This demonstrates how methods can return closures, and how these closures retain
a memory of their surrounding scope, which they can then use or update the
variables that are apart of their binding, even if the `Proc`s or `lambda`s are
called somewhere else.
=end
