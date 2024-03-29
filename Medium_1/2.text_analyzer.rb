# Text Analyzer - Sandwich Code

# Fill out the rest of the Ruby code below so it prints output like that shown
# in "Sample Output." You should read the text from a simple text file that you
# provide. (We also supply some example text below, but try the program with
# your text as well.)

# This question requires that you read a simple text file. Try searching the Web
# for information on how to do this, and also take a look at the File class in
# the Ruby documentation. If you can't figure it out on your own, don't worry:
# just put the data directly into your program; an Array with one element per
# line would be ideal.

# Read the text file in the #process method and pass the text to the block
# provided in each call. Everything you need to work on is either part of the
# #process method or part of the blocks. You need no other additions or changes.

# The text you use does not have to produce the same numbers as the sample
# output but should have the indicated format.

class TextAnalyzer
  def process
    file = File.open("sample_text.txt", "r")
    yield(file.readlines)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process do |lines|
  paragraphs = 1
  lines.each { |line| paragraphs += 1 if line.strip.empty? }
  puts "#{paragraphs} paragraphs"
end

analyzer.process do |lines|
  num_lines = 0
  lines.each { |line| num_lines += 1 }
  puts "#{num_lines} lines"
end

analyzer.process do |lines|
  words = 0
  lines.each { |line| words += line.split.size }
  puts "#{words} words"
end

# Sample Output

# 3 paragraphs
# 15 lines
# 126 words