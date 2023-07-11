# Why does the following raise an error?

def a_method(pro)
  pro.call
end

a = 'friend'
a_method(&a)

=begin
When we run this code, a `TypeError` is raised. This because we're attempting to
call the `Symbol#to_proc` method on a string object. When a unary `&` operator
is prepended to the argument being passed in, Ruby will first check if it's a
`Proc` object. If the object isn't a `Proc`, Ruby will then call
`Symbol#to_proc` on it in an attempt to convert it to a `Proc`. However, this
method can only be called on `Symbol` objects, which is why a `TypeError` is
thrown when we attempt to call it on a string. 
=end