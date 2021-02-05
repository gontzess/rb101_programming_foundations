# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

def uppercase?(str)
  str.chars.keep_if { |char| char =~ /[a-zA-Z]/ }.all? do |char|
    char == char.upcase
  end
end

#LS Solution: DERPPPP
def uppercase_vLS?(string)
  string == string.upcase
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true

puts uppercase_vLS?('t') == false
puts uppercase_vLS?('T') == true
puts uppercase_vLS?('Four Score') == false
puts uppercase_vLS?('FOUR SCORE') == true
puts uppercase_vLS?('4SCORE!') == true
puts uppercase_vLS?('') == true
