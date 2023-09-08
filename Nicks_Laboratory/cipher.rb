# Welcome to the Coding Challenge.

# Instructions

# Your program should pass all tests shown below. You may add more tests if you
# wish, but please do not change any of the existing tests.

# Your program should pass Rubocop. Use the .rubocop.yml file from this
# assignment.

# We grade your program based on passing tests, Rubocop, and on your code.

# Upload your code in the text box below. Don't forget to format your code!

# The Challenge

# Write a program that conforms to the above instructions and encrypts text
# strings with the following simple (and very unsecure) cipher:

# Replace each letter in the original string with another letter.
# The first letter of the alphabet should be replaced with the last.
# The second letter of the alphabet should be replaced with the next to last.
# The third letter of the alphabet should be replace with the second from the
# last.
# Continue on in this manner throughout the alphabet.
# For example, the word money gets encrypted as nlmvb.

=begin

P:

Need to write a program that takes a string and encodes. We should replace the
first letter of the alphabet with the last, the second with the second last and
so on so forth.

Our method needs to handle strings and sentences. It also appears that if the
word exceeds 5 characters, or if the string is a sentence, we need to create
slices of 5 characters separating each by a space.

=end

class Cipher
  ALPHAS = ('a'..'z').to_a
  ALPHAS_REVERSE = ('a'..'z').to_a.reverse
  ALPHAS_HASH = ALPHAS.zip(ALPHAS_REVERSE).to_h

  def self.encode(str)
    str.size > 5 ? encode_long_word(str) : encode_small_word(str)
  end

  def self.encode_small_word(str)
    chars = str.downcase.gsub(/[^a-zA-Z0-9]/, '').chars
    chars.map! do |char|
      if (char =~ /[a-z]/i).nil?
        char
      else
        ALPHAS_HASH[char]
      end
    end.join
  end

  def self.encode_long_word(str)
    chars = str.downcase.gsub(/[^a-zA-Z0-9]/, '').chars.each_slice(5).to_a
    chars.map! do |subarr|
      subarr.map! do |char|
        (char =~ /[a-z]/i).nil? ? char : ALPHAS_HASH[char]
      end
      subarr.join
    end.join(' ')
  end
end

p Cipher.encode('O M G')
p Cipher.encode_long_word('mindblowingly')
