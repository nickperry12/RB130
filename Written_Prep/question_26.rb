# What will the method call call_me output? Why?

def call_me(some_code)
  some_code.call
end

name = "Robert"

def name
  "Joe"
end

chunk_of_code = Proc.new {puts "hi #{name}"}

call_me(chunk_of_code)

=begin
Line 15 will output the string "hi Robert". When we initialize a new `Proc`
object on line 13, it will bind to its surrounding artifacts - method refrences,
variable names, constants, and other artifacts. When Ruby attempts to resolve
`name` within the string, it will first search for any variables with that name.
If it doesn't find a `name` variable, it will then search for a method called
`name`. In this case, it will find the local variable `name` is initialized on
line 7 and will return the string that is initialized to it.
=end