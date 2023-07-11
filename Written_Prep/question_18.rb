# What is happening in the code below?

arr = [1, 2, 3, 4, 5]

p arr.map(&:to_s) # specifically `&:to_s`

=begin
On line 5, we're passing a method name as a symbol into the `map` method as an
argument. `:to_s` is then converted to a `Proc` object, by way of the `#to_proc`
method being called on it. It is then converted to a block. The `:to_s` gets
converted to `{ |n| n.to_s }`.
=end