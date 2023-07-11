# Triangles 

# Write a program to determine whether a triangle is equilateral,
# isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0,
# and the sum of the lengths of any two sides must be greater than the length of
# the third side.

=begin
P:

Create a program that can determine whether a new instantiated object of the
`Triangle` class is equilateral, isosceles or scalene. 

Equilateral has 3 equal sides

Isosceles has two equal sides

Scalene has 3 different lengths for all 3 sides

In order for the shape to be a triangle, all sides must have a length greater
than 0, and the sum ofthe lengths of any two sides must be greater than the
length of the third side.

E:

require 'minitest/autorun'
require_relative 'triangles'

class TriangleTest < Minitest::Test
  def test_equilateral_equal_sides
    triangle = Triangle.new(2, 2, 2)
    assert_equal 'equilateral', triangle.kind
  end

  def test_larger_equilateral_equal_sides
    skip
    triangle = Triangle.new(10, 10, 10)
    assert_equal 'equilateral', triangle.kind
  end

  def test_isosceles_last_two_sides_equal
    skip
    triangle = Triangle.new(3, 4, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_last_sides_equal
    skip
    triangle = Triangle.new(4, 3, 4)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_first_two_sides_equal
    skip
    triangle = Triangle.new(4, 4, 3)
    assert_equal 'isosceles', triangle.kind
  end

  def test_isosceles_exactly_two_sides_equal
    skip
    triangle = Triangle.new(10, 10, 2)
    assert_equal 'isosceles', triangle.kind
  end

  def test_scalene_no_equal_sides
    skip
    triangle = Triangle.new(3, 4, 5)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_larger_no_equal_sides
    skip
    triangle = Triangle.new(10, 11, 12)
    assert_equal 'scalene', triangle.kind
  end

  def test_scalene_no_equal_sides_descending
    skip
    triangle = Triangle.new(5, 4, 2)
    assert_equal 'scalene', triangle.kind
  end

  def test_small_triangles_are_legal
    skip
    triangle = Triangle.new(0.4, 0.6, 0.3)
    assert_equal 'scalene', triangle.kind
  end

  def test_no_size_is_illegal
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(0, 0, 0)
    end
  end

  def test_negative_size_is_illegal
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(3, 4, -5)
    end
  end

  def test_size_inequality_is_illegal
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_2
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(7, 3, 2)
    end
  end

  def test_size_inequality_is_illegal_3
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(10, 1, 3)
    end
  end

  def test_size_inequality_is_illegal_4
    skip
    assert_raises(ArgumentError) do
      triangle = Triangle.new(1, 1, 2)
    end
  end
end

D:

Need to define a `Triangle` class
Going to need 3 instance variables
- @side1
- @side2
- @side3

Can also use an array to store the sides for comparison (is it needed though?)

Modeling:

Can see from the test cases we need the following method:

`Triangle#kind`

This method should return the type of triangle it is using a string object.

Can also see that if the shape is not a triangle, which is dicated by the rules
outlined above, then an `ArgumentError` should be raised.

Again, in order for it to be a triangle, we need it to meet the following
criteria:

1. All sides have a length greater than 0
2. Any two sides must have a sum greater than the third side

Triangle types:

Equilateral => all equal sides
Isosceles => two equal sides
Scalene => all sides different lengths

Triangle#kind

initialize `num_equal_sides` to 1
compare `@side1`, `@side2` and `@side3`
- if two are equal
  - return 'isosceles'
- if all are equal
  - return 'equilateral'
- if none are equal
  - return 'scalene'

Triangle#is_triangle?


if all lengths are greater than 0
  - return true

if any two sides have a greater sum than the third side
  - return true

else
  - return false


=end

class Triangle
  def initialize(side1, side2, side3)
    @side1, @side2, @side3 = side1, side2, side3
    raise ArgumentError unless is_triangle?
  end

  def two_sides_greater?
    sides = [@side1, @side2, @side3].sort
    sides[0..1].sum > sides[2]
  end

  def all_sides_greater_than_zero?
    [@side1, @side2, @side3].all? { |side| side > 0 }
  end

  def is_triangle?
    if two_sides_greater? && all_sides_greater_than_zero?
      return true
    end

    false
  end

  def equilateral?
    @side1 == @side2 && @side2 == @side3 && @side3 == @side1
  end

  def isosceles?
    @side1 == @side2 || @side2 == @side3 || @side3 == @side1
  end

  def scalene?
    @side1 != @side2 && @side2 != @side3 && @side3 != @side1
  end

  def kind
    case
    when equilateral?
      return "equilateral"
    when isosceles?
      return "isosceles"
    when scalene?
      return "scalene"
    end
  end
end
