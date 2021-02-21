# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

DIGITS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

def word_to_digit(string)
  DIGITS.each_with_index do |word, int|
    if string.include?(word)
      string.gsub!(word, int.to_s)
    end
  end
  string
end


# puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
#
# puts word_to_digit('Please call me at five five five one two three four. Thanks.')

string = 'Please call me at five five five one two three four. Thanks.'
p string

word_to_digit(string)
p string
