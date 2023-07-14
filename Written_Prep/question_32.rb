# Why do we get a LocalJumpError when executing the below code? & How do we fix
# it so the output is hi? (2 possible ways)

def some(&block)
  yield
end

bloc = proc { p "hi" } # do not alter

some(&bloc)

=begin
When we attempt to run this code, a `LocalJumpError` is raised because we're
attepting to yield execution to a block when no block is being passed in. The
variable `bloc` is being passed in as an argument, which is initialized to a
`Proc` object. There are two ways we can make this code work:

1) We prepend the argument `bloc` and the parameter `block` in the method
   definition with a unary `&` operator. Prepending `bloc` with the unary `&`
   operator will convert the `Proc` object to a block. This is passing in an
   explicit block.

2) We can also impliciy pass in a block using either a `{}` block or `do..end`
   block.

Both of these solutions will allow the code to run without raising a
`LocalJumpError` and will give us the output of `"hi"`.
=end