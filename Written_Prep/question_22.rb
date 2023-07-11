# What will be outputted from the method invocation block_method('turtle')
# below? Why does/doesn't it raise an error?

def block_method(animal)
  yield(animal)
end

block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

=begin
The output we'll get from this code snippet is `"This is a turtle and a ."`. We
get an empty string where `#{seal}` is because there is no arguent being passed
for the `seal` parameter, so Ruby assigns it a value of `nil`. No error is
raised because blocks have lenient arity - we don't have to pass in the exact
amount of arguments. When we pass in one less argument than is expected, which
is the case in this code snippet, Ruby will assign that the local block variable
a value of `nil`.
=end