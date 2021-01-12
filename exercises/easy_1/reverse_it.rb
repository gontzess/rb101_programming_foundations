# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

def reverse_sentence(str)
  words = str.split
  reverse = []
  words.each do |word|
    reverse.unshift(word)
  end
  reverse.join(' ')
end



# should print true for following
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

=begin
# LS solution
def reverse_sentence(string)
  string.split.reverse.join(' ')
end
=end
