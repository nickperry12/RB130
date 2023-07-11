def some_method
  yield
end

p some_method { "hi" }