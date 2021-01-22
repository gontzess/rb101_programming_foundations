# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes. Words consist of any string of characters that do not include a space.

def word_sizes(sentence)
  words = {}
  sentence.split.each do |word|
    if words.include?(word.length)
      words[word.length] += 1
    else
      words[word.length] = 1
    end
  end
  words
end

def word_sizes_v2(sentence)
  words = Hash.new(0)
  sentence.split.each do |word|
    words[word.length] += 1
  end
  words
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}

puts word_sizes('Four score and seven.')
puts word_sizes('Hey diddle diddle, the cat and the fiddle!')
puts word_sizes("What's up doc?")
puts word_sizes('')

puts word_sizes_v2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes_v2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes_v2("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes_v2('') == {}

puts word_sizes_v2('Four score and seven.')
puts word_sizes_v2('Hey diddle diddle, the cat and the fiddle!')
puts word_sizes_v2("What's up doc?")
puts word_sizes_v2('')
