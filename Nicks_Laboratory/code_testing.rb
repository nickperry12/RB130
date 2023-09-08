greeting = "Hello"

def change_greeting
  yield
end

change_greeting { greeting = "Goodbye" }
p greeting # "Goodbye"