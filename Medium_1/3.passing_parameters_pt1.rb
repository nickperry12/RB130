# Passing Parameters Part 1

# Modify the method below so that the display/output of items is moved to a
# block, and its implementation is left up to the user of the gather method.

=begin
P:

We want to move the display/output of each item to a block, and we want to leave
that implementation up to the user. 

Modeling:

We're yielding each item of the array to the block
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts "We have #{produce.join(", ")}." }

puts "-------------------"

gather(items) do |produce|
  produce.each { |veg| puts "We've gathered #{veg}!"}
end

puts "-------------------"

gather(items) do |produce|
  puts "The grocery store was out of #{produce[0]} but they had #{produce[1]} and #{produce[2]}!"
end