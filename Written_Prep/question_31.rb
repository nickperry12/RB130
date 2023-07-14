# How does `Kernel#block_given?` work?

=begin
The `Kernel#block_given?` method, according to the documentation, will return
`true` if `yield` would execute a block in the current context, and `false` if
not. This essentially means that, if a block is being passed into the method,
`block_given?` will return `true`, and if not, will return `false`.
=end