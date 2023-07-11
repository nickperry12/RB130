# Why is it important to know that methods and blocks can return closures?

=begin
It's important to know because it lets us know that, because our method returns
either a `Proc` or a `lambda`, we can subsequently call these closures
repeatedly. We can also pass these closures into other methods to execute the
code within them.
=end