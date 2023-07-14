# What is the SEAT approach and what are its benefits?

=begin
SEAT is an acronym and stands for the following:

S - Set up the necessary objects we will use for testing
E - Execute the code against the objects we're testing
A - Assert that the code is returning what we expect it to
T - Tear down and clean up any lingering files or artifacts

The benefit of this approach is it reduces redundancy and allows us to automate
our testing. We only have to set up once outside of each test.
=end