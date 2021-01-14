# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

ALPHANUMERIC = ('0'..'9').to_a + ('a'..'z').to_a

def real_palindrome?(word)
  clean_word = ''
  word.downcase.each_char { |char| clean_word << char if ALPHANUMERIC.include?(char) }
  clean_word == clean_word.reverse
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false

# LS Solution:
def real_palindrome_alt?(word)
  word = word.downcase.delete('^a-z0-9')
  word == word.reverse
end

puts real_palindrome_alt?('madam') == true
puts real_palindrome_alt?('Madam') == true           # (case does not matter)
puts real_palindrome_alt?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome_alt?('356653') == true
puts real_palindrome_alt?('356a653') == true
puts real_palindrome_alt?('123ab321') == false
