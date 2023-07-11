# What other differences are there between lambdas and procs? (might not be
# assessed on this, but good to know)

=begin
In addition to their arity, `lambda`s and `Proc`s both handle the use of the
keyword `return` differently. When `return` is used within a `lamda`, it passes
control back to the calling method, just like a regular method would. In
contrast, when we use `return` within a `Proc`, it causes an immediate exit
from the enclosing method, skipping any execution of any code that comes after
it.
=end