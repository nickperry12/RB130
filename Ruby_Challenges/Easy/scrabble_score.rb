# Scrabble Score

# Write a program that, given a word, computes the Scrabble score for that word.

# Letter Values

# You'll need the following tile scores:

# Letter	                       Value
#---------------------------------------
# A, E, I, O, U, L, N, R, S, T	| 1
# D, G	                        | 2
# B, C, M, P                    | 3
# F, H, V, W, Y	                | 4
# K	                            | 5
# J, X	                        | 8
# Q, Z	                        | 10
#---------------------------------------

# How to Score

# Sum the values of all the tiles used in each word. For instance, lets consider
# the word CABBAGE which has the following letters and point values:

# 3 points for C
# 1 point for each A (there are two)
# 3 points for B (there are two)
# 2 points for G
# 1 point for E

# Thus, to compute the final total (14 points), we count:

# 3 + 2*1 + 2*3 + 2 + 1
# => 3 + 2 + 6 + 3
# => 5 + 9
# => 14

=begin
P: 

Build a program that computes the scrabble score for a given word.

This is the list of words and their respective points:

# Letter	                       Value
#---------------------------------------
# A, E, I, O, U, L, N, R, S, T	| 1
# D, G	                        | 2
# B, C, M, P                    | 3
# F, H, V, W, Y	                | 4
# K	                            | 5
# J, X	                        | 8
# Q, Z	                        | 10
#---------------------------------------

Will need to handle `nil` values for the string
Will also need to handle empty strings or strings with nothing but white space

E:

See `scrabble_score_test.rb` for test cases

D:

`Hash` object to store words and points
- list of letters for keys, and points for values

Need an instance method `Scrabble#score`

As well as a class method `Scrabble::score`

Modeling/Algorithm:

SCRABBLE_PONTS = {
  ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
  ['D,' 'G'] => 2,
  ['B', 'C', 'M', 'P'] => 3,
  ['F', 'H', 'V', 'W', 'Y'] => 4,
  ['K'] => 5,
  ['J', 'X'] => 6,
  ['Q', 'Z'] => 7
}

I: alacrity
O: 13

first: 'a', 1
second: 'l', 1
third: 'a', 1
...

How do we handle `nil` values?

if word == `nil`, return 0

Initialize a constant `SCRABBLE_POINTS`
  - each key is a list of letter, the value is the points for those letters

Initialize `points` to 0

Iterate through the chars of the given word
  - Iterate through `SCRABBLE_POINTS`
    - If the current list includes the current char
      - Increment `points` by the value

Return `points`

=end

class Scrabble
  SCRABBLE_POINTS = {
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
    ['D', 'G'] => 2,
    ['B', 'C', 'M', 'P'] => 3,
    ['F', 'H', 'V', 'W', 'Y'] => 4,
    ['K'] => 5,
    ['J', 'X'] => 8,
    ['Q', 'Z'] => 10
  }

  def initialize(word)
    if word == nil
      @word = ''
    else
      @word = word.upcase
    end
  end

  def self.score(word)
    self.new(word).score
  end

  def score
    total_points = 0

    word.each_char do |char|
      SCRABBLE_POINTS.each do |list, points|
        if list.include?(char)
          total_points += points 
          break # prevents needlessly iterating further through the rest of hash
        end
      end
    end

    total_points
  end

  private

  attr_reader :word
end
