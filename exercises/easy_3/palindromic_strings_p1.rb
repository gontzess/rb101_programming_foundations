# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(word)
  word == word.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

puts palindrome?('madam'.chars) == true
puts palindrome?('Madam'.chars) == false          # (case matters)
puts palindrome?("madam i'm adam".chars) == false # (all characters matter)
puts palindrome?('356653'.chars) == true

puts palindrome?([1, 0, 0, 1]) == true
puts palindrome?([1, 0, 0, 4]) == false          # (case matters)
