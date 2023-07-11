# # Diamond

# The diamond exercise takes as its input a letter, and outputs it in a diamond
# shape. Given a letter, it prints a diamond starting with 'A', with the
# supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

# Examples

# Diamond for letter "A"

# A

# Diamond for letter "B"

#  A
# B B
#  A

# Diamond for letter "C"

#   A
#  B B
# C   C
#  B B
#   A

# Diamond for letter "D"

#     A
#    B B
#   C   C
#  D     D
# E       E
#  D     D
#   C   C
#    B B
#     A
=begin

P:

Need to write a program that creates a diamondusing the letters "A" to the given
letter. The diamond should be hollow, with the first and last character of each
row consisting of the respective letter for that row. See above for examples.

E:

See `diamond_test.rb` for test cases.

Algoritm/Modeling:

We can use the step method to iterate over a range to get our desired amount of
characters in each row.

I: "C"

row_size = 1
max_row_size = ("A".."C").to_a.size * 2 - 1

("A".."C").to_a.each do |char|
  rows << (char * start_row)
  row_size += 2
end

=> ["A", "BBB", "CCCCC"]

Initialize row_size to 1
Initialize letters to a list of letters from "A" to given letter
Initialize rows to an empty list

Iterate through `letters`
  - multiply the current letter by `row_size`
  - push the string into `rows`
  - increment `row_size` by 2

Iterate through and transform each row
  - Transform each string in `rows` to a subarray of single letters

Iterate though `letters`
  - Transform each subarray of letters
    - If the current index is 0 or equal to the size of `rows` - 1
      - return the letter
    - if not, return a " "

Iterate and transform each row
  - Join each row together and center them by `row_size`

Concatenate `rows` with the reverse order of rows from index 0 to -2

Initialize `str` to the joined array of `rows`
  - Join each row separated by a new line
=end

class Diamond
  def self.make_diamond(letter)
    letters = self.transform_list_of_letters(letter)
    diamond = letters += letters[0..-2].reverse
    diamond.join("\n") + "\n"
  end

  class << self
    private

    def create_list_of_letters(letter)
      row_size = 1
      letters = []
      list = ("A"..letter).to_a
      list.each do |let|
        letters << let * row_size
        row_size += 2
      end
  
      letters
    end
  
    def transform_list_of_letters(letter)
      letters = self.create_list_of_letters(letter)
      letters.map! { |letter| letter.chars }
      letters.each do |subarr|
        subarr.map!.with_index do |char, idx|
          if idx == 0 || idx == subarr.size - 1
            char
          else
            " "
          end
        end
      end
  
      letters.map(&:join).map { |row| row.center(letters.max.size) }
    end
  end

  private

  attr_reader :target
end
