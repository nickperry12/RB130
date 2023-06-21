class SomeClass
  CONST = 4

  def some_method
    puts "The constant is #{CONST}"
  end
end

class AnotherClass < SomeClass
  # def some_method
  #   puts "The constant is #{CONST}"
  # end

  CONST = 5
end

AnotherClass.new.some_method