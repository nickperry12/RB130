# Passing Parameters Part 3

# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the
# corresponding output shown in numbers 1-4 listed below:

# 1)

gather(items) do |produce|
  puts "#{produce[0..2].join(', ')}"
  puts "#{produce[3] }"
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2)

gather(items) do |apple, *veg, wheat|
  puts apple
  puts veg.join(', ')
  puts wheat
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3)

gather(items) do | apple, *other|
  puts apple
  puts other.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)

gather(items) do |produce|
  puts produce[0..2].join(', ') + " and #{produce[3]}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!