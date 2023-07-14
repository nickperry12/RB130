# What does the following code tell us about explicitly returning from proc's
# and lambda's? (once again probably not assessed on this, but good to know ;)

def lambda_return
  puts "Before lambda call."
  lambda {return}.call
  puts "After lambda call."
end

def proc_return
  puts "Before proc call."
  proc {return}.call
  puts "After proc call."
end

lambda_return #=> "Before lambda call."
              #=> "After lambda call."

proc_return #=> "Before proc call."

=begin
This code snippet tells us how `lambda`s and `Proc`s handle the use of the
`return` keyword differently. When `return` is used within a `lambda`, it
returns control back to the calling method, executing any code that comes after
the `lambda` execution. 

`Proc`s handle use of `return` differently. When `return` is used within a
`Proc`, execution stops and Ruby exits from the surrounding block or method
immediately.
=end