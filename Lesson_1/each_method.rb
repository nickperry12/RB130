# method implementation
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

# method invocation
array = [1, 2, 3, 4, 5]

p each((array)) { |num| puts num }