# Describe the arity differences of blocks, procs, methods and lambdas.

=begin
Arity refers to the rule regarding the number of arguments that you must pass to
a block, `Proc`, `lambda` or method. In Ruby blocks and `Proc`s have lenient
arity - no error will be thrown when we try to pass in too few or too many
arguments. In contrast, methods and `lambda`s have strict arity, which means
that we must pass in the exact number of arguments that the method or `lambda`
expects; if we fail to do that an error will be thrown.
=end