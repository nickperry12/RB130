# How do we make a block argument manditory?

=begin
We can make a block argument mandatory by using an explicit block instead of an
implicit block. We define a method that prepends the parameter name with the
unary `&` operator. This converts the block argument to a `Proc` object.

Within the method, we invoke the `call` method on the parameter (this time
without the `&`). This is an example:

```ruby
def some_method(&block)
  block.call
end
```

When we try to invoke this method without a block being passed in, a
`NoMethodError` will be thrown as the parameter will reference `nil`, and there
is no `call` method for a `nil` object. But, if we pass in a block, the program
runs as expected.
=end