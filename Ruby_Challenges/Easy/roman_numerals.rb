# Roman Numerals

# Write some code that converts modern decimal numbers into their Roman number
# equivalents.

# The Romans were a clever bunch. They conquered most of Europe and ruled it for
# hundreds of years. They invented concrete and straight roads and even bikinis.
# One thing they never discovered though was the number zero. This made writing
# and dating extensive histories of their exploits slightly more challenging,
# but the system of numbers they came up with is still in use today. For example
# the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that
# these letters have lots of straight lines and are hence easy to hack into
# stone tablets.

# 1  => I
# 10  => X
# 7  => VII
 
# There is no need to be able to convert numbers larger than about 3000. (The
# Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit
# separately starting with the left most digit and skipping any digit with a
# value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals, 1990
# is MCMX

# 1000=M
# 900=CM
# 90=XC

# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII

=begin
P:

Need to write a program that converts an integer to its roman numeral
equivalent.

Don't need to worry about converting numbers greater than 3000. Doesn't appear
to be any test cases that have integers greater than 3000, so don't need to
worry about handling them.

E:

See `roman_numerals_test.rb` for test cases

Modeling:


I The easiest way to note down a number is to make that many marks - little I's.
Thus I means 1, II means 2, III means 3. However, four strokes seemed like too
many....

V So the Romans moved on to the symbol for 5 - V. Placing I in front of the V —
or placing any smaller number in front of any larger number — indicates
subtraction. So IV means 4. After V comes a series of additions - VI means 6,
VII means 7, VIII means 8.

X X means 10. But wait — what about 9? Same deal. IX means to subtract I from X,
leaving 9. Numbers in the teens, twenties and thirties follow the same form as
the first set, only with X's indicating the number of tens. So XXXI is 31, and
XXIV is 24.

L L means 50. Based on what you've learned, I bet you can figure out what 40 is.
If you guessed XL, you're right = 10 subtracted from 50. And thus 60, 70, and 80
are LX, LXX and LXXX.

C C stands for centum, the Latin word for 100. A centurion led 100 men. We still
use this in words like "century" and "cent." The subtraction rule means 90 is
written as XC. Like the X's and L's, the C's are tacked on to the beginning of
numbers to indicate how many hundreds there are: CCCLXIX is 369.

D D stands for 500. As you can probably guess by this time, CD means 400. So
CDXLVIII is 448. (See why we switched systems?)

M M is 1,000. You see a lot of Ms because Roman numerals are used a lot to
indicate dates. For instance, this page was written in the year of Nova Roma's
founding, 1998 CE (Common Era; Christians use AD for Anno Domini, "year of our
Lord"). That year is written as MCMXCVIII. But wait! Nova Roma counts years from
the founding of Rome, ab urbe condita. By that reckoning Nova Roma was founded
in 2751 a.u.c. or MMDCCLI.

Use the above information to define the following method:

`RomanNumeral#to_roman(int)`

initialize `ROMAN_NUMERALS` to the following hash

ROMAN_NUMERALS = {
  1 => "I",
  4 => "IV",
  5 => "V",
  9 => "IX",
  10 => "X",
  40 => "XL",
  50 => "L",
  90 => "XC",
  100 => "C",
  400 => "CD",
  500 => "D",
  900 => "CM",
  1000 => "M"
}

number = 322

digits = number.digits 
=> [2, 2, 3]

iterate over and transform each digit to digit * 10**idx

[2, 20, 300]

iterate through digits |num|
 - iterate through `ROMAN_NUMERALS` |key, val|
  




---------------------------------------------------------

initialize `roman_numeral` to an empty string
initialize `number` to @number => 95

iterate through `ROMAN_NUMERALS` |num, rom|
  - while the `digits` is greater than or equal to `num`
    - push `rom` in to `roman_numeral`
    - subtract `num` from `number`
  - end iteration when `num` is less than `number`

return `roman_numeral`

first iteration: 1000 => 'M', `number` == 95
`number` is not greater than 1000

nothing happens until we get to the following pair

90 => "XC"
`digits` is greater than or equal to 90
"XC" is pushed into `roman_numeral` => "XC"
90 is subtracted from 95 => `digits` is now 5

5 => "V"
`digits` is greater than or equal to 5
"V" is pushed into `roman_numerals` => "XCV"
5 is subtracted from 5 => `digits` is now 0

Iteration ends => `roman_numerals` = "XCV"


=end

class RomanNumeral
  ROMAN_NUMERALS = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_roman
    digits = number
    roman_numeral = ""

    ROMAN_NUMERALS.each do |num, rom|
      while digits >= num
        roman_numeral += rom
        digits -= num
      end
    end

    roman_numeral
  end
end

number = RomanNumeral.new(322)
p number.to_roman
