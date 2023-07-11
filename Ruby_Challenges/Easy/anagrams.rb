# Write a program that takes a word and a list of possible anagrams and selects
# the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists",
# "google", "inlets", and "banana", the program should return a list containing
# "inlets". Please read the test suite for the exact rules of anagrams.

=begin
P:

Need to write a program that takes a word, and when provided a list of words,
selects and returns a list of words that are anagrams.

E:

See `anagrams_test.rb` file for test cases

D:

Working with arrays
Need a `Anagram` class
Need a `Anagram#match` method

Modeling/Algorithm:

`Anagram#match`

Iterate through the given list of words
  - Select the words that when split into a list of chars and the order is
    sorted, then joined back into a word, is the equivalent to the given word
    when that word is also split into a list of chars, the order sorted, and
    joined back into a word

Return the list of words

=end

class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(list)
    sorted_word = word.downcase.chars.sort.join
    anagrams = []
    
    list.each do |item|
      next if item.downcase == word.downcase
      anagrams << item if item.downcase.chars.sort.join == sorted_word
    end

    anagrams
  end
end
