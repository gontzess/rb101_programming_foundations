# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def double_consonants(str)
  str = str.chars.map do |char|
    char.downcase =~ /[a-z&&[^aeiou]]/ ? char * 2 : char
  end
  str.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""

puts double_consonants('String')
puts double_consonants("Hello-World!")
puts double_consonants("July 4th")
puts double_consonants('')
