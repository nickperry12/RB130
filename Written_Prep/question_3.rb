# How does binding affect the scope of closures?

=begin
When we create a closure it binds to all of the surrounding artifacts - local
variables, method references, constants and other artifacts (whatever it needs
to execute correctly). Whatever is in scope when the closure is created will be
apart of the binding. If a variable is initialized after the closure is created,
it will not be apart of the binding, and if we try to reference the variable
with that chunk of code, an error will be thrown. Additionally, when we reassign
that variable to a different object after the closure is created, that change
will be reflected when we execute the code.
=end