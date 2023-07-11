# Describe the two reasons we use blocks, use examples.

=begin
1. Defering code implementation to method execution decision.

There are two roles involed with a method - a method implementor and a method
user (this could be the same person). There are times where the method
implementor is not 100% certain on how the method will be called, and wants to
leave some of the implementation to the method user. This is when we can use a
block. This allows users to refine the method implementation, without having to
modify the method implementation for everyone else.

For example:

We want have an array that we want to iterate through, and performs some action
on the elements within the array. However, we're undecided on what that action
should be, and we leave that up to the user to decide. We can define a method
that yields each element to the block, and within the block the user decides
what action he wants to perform on each element.

2. Writing sandwich code - methods that perform a before and after action.

Sometimes we want to write methods that perform some before and after actions.
We leave the action that is performed in between the before and after up to the
method user.

For example:

We want to calculate the time it takes to execute some code. What that code is,
the method implementor isn't sure of, so they leave that decision up to the
method user. Here we would define a method that yields to a block, and states
the current time before the code within the block is executed, and the time
after it finishes executing.

```ruby
def time_it
	time_before = Time.now
	yield # execute the implicit block
	time_after = Time.now

	puts "It took #{time_after - time_now} seconds."
end

time_it { sleep(3) }
time_it { "hello world" }
```

=end
