# How does `assert_equal` compare it's arguments?

=begin
`assert_equal` takes two arguments, the first being the expected value or
outcome of our test, and the second argument being the actual value or outcome.
`assert_equal` uses the `==` method to compare the two arguments, and fails
unless `exp == act`. 
=end