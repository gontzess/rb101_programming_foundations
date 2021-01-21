# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

def swap(phrase)
  swapped_words = phrase.split.map do |word|
    letters = word.chars
    first = letters.shift
    last = letters.pop
    letters.unshift(last).push(first).join
  end
  swapped_words.join(' ')
end

# LS Solution with FURTHER EXPLORATION:

def swap_first_last_characters_v1(word)
  puts word.object_id
  word[0], word[-1] = word[-1], word[0]
  puts word.object_id
  word
end

def swap_first_last_characters_v2(a, b)
  a, b = b, a
end

def swap_LS1(words)
  result = words.split.map do |word|
    swap_first_last_characters_v1(word)
  end
  result.join(' ')
end

def swap_LS2(words)
  result = words.split.map do |word|
    swap_first_last_characters_v2(word[0], word[-1])
  end
  result.join(' ')
end

# FURTHER EXPLORATION
# LS2 and swap_first_last_characters_v2 doesn't work because you are creating a new object with string#[] before passing to the method. It no longer has connection to the original object, even if you use mutations within the helper method. The LS1 and swap_first_last_characters_v1 version works because it passes the reference to the word object, then mutates then leverages index assignment to mutate the referenced object.

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

puts swap('Oh what a wonderful day it is')
puts swap('Abcde')
puts swap('a')

puts swap_LS1('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap_LS1('Abcde') == 'ebcdA'
puts swap_LS1('a') == 'a'

puts swap_LS1('Oh what a wonderful day it is')
puts swap_LS1('Abcde')
puts swap_LS1('a')

puts swap_LS2('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap_LS2('Abcde') == 'ebcdA'
puts swap_LS2('a') == 'a'

puts swap_LS2('Oh what a wonderful day it is')
puts swap_LS2('Abcde')
puts swap_LS2('a')
