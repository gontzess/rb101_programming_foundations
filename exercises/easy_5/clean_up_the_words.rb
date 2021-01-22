# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

def cleanup_v1(phrase)
  phrase.gsub(/[^a-z]/, ' ').gsub(/ {2,}/, ' ')
end

def cleanup_vLS(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

# FURTHER EXPLORATION: If you originally wrote this method with regular expressions, try writing it without regular expressions.

ALPHA = ('a'..'z').to_a

def cleanup_v2(phrase)
  ary_clean = []
  phrase.chars.each do |char|
    if ALPHA.include?(char)
      ary_clean << char
    else
      ary_clean << ' ' unless ary_clean.last == ' '
    end
  end
  ary_clean.join
end


puts cleanup_v1("---what's my +*& line?") == ' what s my line '
puts cleanup_v1("---what's my +*& line?")

puts cleanup_vLS("---what's my +*& line?") == ' what s my line '
puts cleanup_vLS("---what's my +*& line?")

puts cleanup_v2("---what's my +*& line?") == ' what s my line '
puts cleanup_v2("---what's my +*& line?")
