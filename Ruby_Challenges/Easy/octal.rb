# Octal

# Implement octal to decimal conversion. Given an octal input string, your
# program should produce a decimal output. Treat invalid input as octal 0.

# Note: Implement the conversion yourself. Don't use any built-in or library
# methods that perform the necessary conversions for you. In this exercise, the
# code necessary to perform the conversion is what we're looking for.

# About Octal (Base-8)

# Decimal is a base-10 system. A number 233 in base 10 notation can be
# understood as a linear combination of powers of 10:

# The rightmost digit gets multiplied by 10^0 = 1
# The next digit gets multiplied by 10^1 = 10
# The digit after that gets multiplied by 10^2 = 100
# The digit after that gets multiplied by 10^3 = 1000
# ...
# The n*th* digit gets multiplied by 10^n-1.
# All of these values are then summed.
# Thus:

# 233 # decimal
# = 2*10^2 + 3*10^1 + 3*10^0
# = 2*100  + 3*10   + 3*1

# Octal numbers are similar, but they use a base-8 system. A number 233 in base
# 8 can be understood as a linear combination of powers of 8:

# The rightmost digit gets multiplied by 8^0 = 1
# The next digit gets multiplied by 8^1 = 8
# The digit after that gets multiplied by 8^2 = 64
# The digit after that gets multiplied by 8^3 = 512
# ...
# The n*th* digit gets multiplied by 8n-1.
# All of these values are then summed.

# 233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155

=begin
P:

We need to write a program that converts a given octal to a decimal number. We
need to perform the conversion without using any Ruby standard library/built in
methods. The numbers given will be a string object. If the string contains
characters that aren't numbers, our method should return 0.

E:

See `octal_test.rb` for test cases and examples

D:

Objects to be used: array, integers

Algorithm / Modeling:

I: "6789" 
O: 0

Formula for decimal nums => Nth digit * 10*n-1 => find the sum 
Formula for octal nums => Nth digit * 8*n-1 => find the sum

9 => 9 * (8**0) => 9 * 1 => 9
8 => 8 * (8**1) => 8 * 8 => 64
7 => 7 * (8**2) => 8 * 64 => 448
6 => 6 * (8**3) => 6 * 512 => 3072

sum => 3593

But the output is 0. Why?

If a number contains the digits 8 and 9, they are treated as invalid as octal
numbers use a base-8 system (digits 0-7).

Take the given string and convert it to an integer

Split the integer into a list of digits
  - Check if any of the digits are greater than 7
    - If so, return 0
  - Multiply each digit by 10**(idx) and then find the sum
  - Return the result

=end

class Octal
  attr_reader :integer

  def initialize(string_num)
    @integer = all_numbers?(string_num) ? string_num.to_i : 0
  end

  def to_decimal
    if is_octal?
      digits = integer.digits
      digits.map.with_index { |digit, idx| digit * (8**idx) }.sum
    else
      0
    end
  end

  private

  def all_numbers?(string_num)
    string_num.chars.all? { |num| ('0'..'9').include?(num) }
  end

  def is_octal?
    digits = integer.digits
    digits.all? { |digit| digit >= 0 && digit <= 7 }
  end
end
