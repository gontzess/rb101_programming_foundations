# Write a method that returns the next to last word in the String passed to it as an argument. Words are any sequence of non-blank characters. You may assume that the input String will always contain at least two words.

def penultimate(str)
  words = str.split
  return '' if words.length == 0
  words.fetch(-2, words[0])
end

# FURTHER EXPLORATION: Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.

# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

def middle_word(str)
  words = str.split
  middle_index = (words.length - 1) / 2
  words.fetch(middle_index, '')
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
puts penultimate('') == ''
puts penultimate('hi') == 'hi'
puts penultimate('')
puts penultimate('hi')

#puts penultimate('last word')
#puts penultimate('Launch School is great!')

puts middle_word('a middle word') == 'middle'
puts middle_word('Launch School is great!') == 'School'
puts middle_word('Launch School usually is great!') == 'usually'
puts middle_word('') == ''
puts middle_word('hi') == 'hi'
