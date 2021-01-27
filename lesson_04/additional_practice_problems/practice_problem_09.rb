# As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

# words = "the flintstones rock"

# would be:

# words = "The Flintstones Rock"

# Write your own version of the rails titleize implementation.

def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

# destructive version of the method:
def titleize_v2(string)
  string.capitalize!.gsub!(/\s[a-z]/) { |s| s[0] + s[1].upcase }
end

words = "the flintstones rock"

titleize(words)
puts titleize(words)
puts words

titleize_v2(words)
puts words
