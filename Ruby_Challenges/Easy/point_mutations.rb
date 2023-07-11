# Point Mutations

# Write a program that can calculate the Hamming distance between two DNA
# strands.

# A mutation is simply a mistake that occurs during the creation or copying of a
# nucleic acid, in particular DNA. Because nucleic acids are vital to cellular
# functions, mutations tend to cause a ripple effect throughout the cell.
# Although mutations are technically mistakes, a very rare mutation may equip
# the cell with a beneficial attribute. In fact, the macro effects of evolution
# are attributable to the accumulated result of beneficial microscopic mutations
# over many generations.

# The simplest and most common type of nucleic acid mutation is a point
# mutation, which replaces one base with another at a single nucleotide.

# By counting the number of differences between two homologous DNA strands taken
# from different genomes with a common ancestor, we get a measure of the minimum
# number of point mutations that could have occurred on the evolutionary path
# between the two strands.

# This is called the Hamming distance.

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^

# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. If you
# have two sequences of unequal length, you should compute the Hamming distance
# over the shorter length.

=begin
We need to create a program that can compute the Hamming distance between two
strands of DNA. 

The Hamming distance is calculated by comparing two DNA strands and is the total
amount of mutations found in the second strand.

For example:
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^

There are a total of 7 mutations, so the Hamming distance is 7.

Note:

If we have two strands of non-equal length, we should only compare up to the
shorter strands length.

E:

See `point_mutations_test.rb` for tests/test cases

Modeling:

We need to define a `DNA#hamming_distance` method

`DNA#hamming_distance`

Initialize `distance` to 0
Initialize `idx` to 0
Iterate through the shorter DNA strand
  - if the current char is not the same as the char at the same index in the
    other strand, increment `distance` by 1

Return `distance`


=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(distance)
    short_strand = strand.size > distance.size ? distance : strand
    long_strand = strand.size > distance.size ? strand : distance
    idx = 0
    ham_distance = 0

    short_strand.each_char do |char|
      ham_distance += 1 if char != long_strand[idx]
      idx += 1
    end
    
    ham_distance
  end
end
