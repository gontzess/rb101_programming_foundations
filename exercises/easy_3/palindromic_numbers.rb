# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(num)
  reverse_num = num.to_s.chars.reverse.join.to_i
  num == reverse_num
end


puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(005500) == true


# LS Solution FUCK SO OBVIOUS!

def palindrome?(word)
  word == word.reverse
end

def palindromic_number_alt?(number)
  palindrome?(number.to_s)
end


puts palindromic_number_alt?(34543) == true
puts palindromic_number_alt?(123210) == false
puts palindromic_number_alt?(22) == true
puts palindromic_number_alt?(5) == true
puts palindromic_number_alt?(005500) == true
