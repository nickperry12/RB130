# What does the following code tell us about lambda's? (probably not assessed on
# this but good to know)

bloc = lambda { p "hi" }

bloc.class # => Proc
bloc.lambda? # => true

new_lam = Lambda.new { p "hi, lambda!" } # => NameError: uninitialized constant Lambda

=begin
This tells us that `lambdas` aren't a class, and are instead an instance of the
`Proc` class. The difference between the two lies in their behaviors - `Proc`s
behave more like blocks, and have lenienty arity, whereas `lambda`s behave more
like methods, and have strict arity. When we say `lambda`s behave more like
methods and `Proc`s behave more like blocks, we are speaking in terms of how
they handle return statements. 

When `lamda`s use the `return` keyword, they pass control back to the calling
method, whereas `Proc`s will exit immediately from the surrounding method or
block.
=end