# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged. You may not use String#swapcase; write your own version of this method.

def swapcase(str)
  characters = str.chars.map do |char|
    case char
    when ('a'..'z') then char.upcase
    when ('A'..'Z') then char.downcase
    else                 char
    end
  end
  characters.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
puts swapcase('CamelCase')
puts swapcase('Tonight on XYZ-TV')
