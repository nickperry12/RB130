# # Robot Name

# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name. The first time you
# boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while, we need to reset a robot to its factory settings, which
# means that their name gets wiped. The next time you ask, it will respond with
# a new random name.

# The names must be random; they should not follow a predictable sequence.
# Random names means there is a risk of collisions. Your solution should not
# allow the use of the same name twice.

=begin

P:

Need to write a program that generates a random name for a robot. It must also,
when required, reset the robots name and assign a new one. The new name cannot
be the same as any name that was previously used.

The names also need to be random and should not follow any sort of predictable
sequence.

E:

See `robot_name_test.rb` for test cases and examples

D:

Need an array to store names that have already been used
- can store names upon name generation or upon factory reset

Could randomize letters and numbers from a range in order to get the name

Name must be returned in a String format

A:

Robot#name

Repeat the following steps until `name.empty?` returns false

Initialize `name_chars` to an empty array
Repeat the following steps twice
  - Randomize characters from 'A'..'Z'
    - Push characters into `name_chars`

Repeat the following steps 3 times
  - Ranomize characters from '0'..'9'
    - Push characters into `name_chars`

Join `name_chars` together
  - If the name is already used, empty the array and start again

Robot#reset

Store the current name into `used_names`
Set `name` to an empty string
Invoke `Robot#name`
=end

class Robot
  attr_reader :name

  @@used_names = []

  def initialize
    generate_name
  end

  def generate_name
    loop do
      name_chars = []
      2.times { name_chars << ('A'..'Z').to_a.sample }
      3.times { name_chars << ('0'..'9').to_a.sample }
      name_chars = [] if @@used_names.include?(name_chars.join)
      self.name = name_chars.join
      @@used_names << name_chars.join
      break if !name_chars.empty?
    end
  end

  def reset
    generate_name
  end

  private

  attr_writer :name
end
