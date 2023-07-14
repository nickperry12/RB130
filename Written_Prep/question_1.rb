# 1. What are closures?

=begin
A closure is a saved chunk of code that we can execute at a later time. They
bind their surrounding artifacts, i.e., variables and methods, and build an
enclosure around them so they can be referenced when the closure is executed.
=end

# 1a. How do we implement closures in Ruby?

=begin
Closures are implemented by using 1 of 3 objects:

1. blocks
2. procs
3. lambdas

We can pass around one of these objects as a chunk of code to execute at a later
time.
=end

# 1b. How do we work with closures in Ruby?

=begin
By using either a block or a lambda, or instantiating a new `Proc` object.
=end