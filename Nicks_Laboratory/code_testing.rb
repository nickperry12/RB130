def some_method(&block)
  arr = []
  if block
    arr << block.call
    arr
  else
    puts "hello"
  end
end

some_method
p some_method { "hi there!" }