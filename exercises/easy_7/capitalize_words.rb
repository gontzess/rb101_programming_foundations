# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase. You may assume that words are any sequence of non-blank characters.

def word_cap(str)
  #str.split.map { |word| word.capitalize }.join(' ')
  str.split.map(&:capitalize).join(' ')
end

# FURTHER EXPLORATION: Ruby conveniently provides the String#capitalize method to capitalize strings. Without that method, how would you solve this problem? Try to come up with at least two solutions.

def word_cap_v2(str)
  str = str.split.map do |word|
    word[0].upcase + word[1..-1].downcase
  end
  str.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

puts word_cap_v2('four score and seven') == 'Four Score And Seven'
puts word_cap_v2('the javaScript language') == 'The Javascript Language'
puts word_cap_v2('this is a "quoted" word') == 'This Is A "quoted" Word'
