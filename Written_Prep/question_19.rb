# How do we get the desired output without altering the method or the method
# invocations?

def call_this
  yield(2)
end

# your code here

p call_this(&:to_s) # => returns 2
p call_this(&:to_i) # => returns "2"

=begin
To get our desired output, we need to prepend `to_s` and `to_i` with `:`, making
them symbols instead of local variables. This allows Ruby to call
`Symbol#to_proc`, converting the symbols to `Proc`s, which can then be converted
to blocks.
=end