=begin
In this assignment, let's implement a reduce method, similar to
Enumerable#reduce. Before we do so, let's get (re-)acquainted with the
Enumerable#reduce method. reduce is another name for the inject method, and its
main goal is to "fold" or "accumulate" a collection into 1 object. What the
specific folding or accumulation mechanism is depends on the code passed in to
the block. Let's take the typical example and sum up an array of integers.
=end

def reduce(array, acc = array[0])
  acc == array[0] ? counter = 1 : counter = 0

  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
