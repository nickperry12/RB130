# method implementation
def times(number)
  counter = 0
  while counter < number
    yield(counter) # counter passed into block as argument
    counter += 1
  end

  number # method returns original argument passed in
end

# method invocation

times(5) do |num| # current object assigned to counter is assigned to `num`
  puts num
end