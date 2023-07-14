# What is the difference between assertions and refutations?

=begin
Assertions confirm that the data returned by our program is what we're expecting
it to return. If the assertion returns `true`, the test passes and we know that
our code is working as intended. We can use many different kinds of assertions,
such as asserting equality, asserting that a specific error is raised, or
asserting that an bject must be an object of a specific class.

Refutations are the opposite of assertions; they refute rather than assert.
Refutations pass if the object we pass into it is falsy. They can take all the
same arguments, but instead of asserting, it's refuting. They are rarely used
except for rare circumstances, or if the team lead of the project you're working
on chooses to use this style.
=end