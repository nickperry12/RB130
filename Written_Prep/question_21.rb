# What concept does the following code demonstrate?

def time_it
  time_before = Time.now
  yield
  time_after= Time.now
  puts "It took #{time_after - time_before} seconds."
end

=begin
This demonstrates the concept of writing sandwich code - code that performs a
"before" and "after" function. Writing sandwich code is one of the reasons we
define methods that use blocks. As the method implementor, our concern isn't
with what happens between the "before" and "after"; that is left to the method
user. By using a block, we can let the method user specify the action. Some
useful cases for using sandwich code are timing, logging, notification systems
and resource management.

Resource management is important involves allocating a portion of our resources,
then performing clean-up to free up that resource. Failing to do so can result
in system crashes, memory leaks or file system corruption.
=end