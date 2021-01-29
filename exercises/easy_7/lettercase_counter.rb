# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

def letter_case_count(str)
  letter_tracker = { lowercase: 0, uppercase: 0, neither: 0 }
  str.each_char do |char|
    if ('a'..'z').include?(char)
      letter_tracker[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      letter_tracker[:uppercase] += 1
    else
      letter_tracker[:neither] += 1
    end
  end
  letter_tracker
end

def letter_case_count_v2(str)
  letter_tracker = Hash.new
  characters = str.chars
  letter_tracker[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  letter_tracker[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  letter_tracker[:neither] = characters.count { |char| char =~ /[^a-zA-Z]/ }
  letter_tracker
end

def letter_case_count_v3(str)
  letter_tracker = Hash.new
  letter_tracker[:lowercase] = str.count("a-z")
  letter_tracker[:uppercase] = str.count("A-Z")
  letter_tracker[:neither] = str.count("^a-zA-Z")
  letter_tracker
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

p letter_case_count('abCdef 123')
p letter_case_count('AbCd +Ef')
p letter_case_count('123')
p letter_case_count('')

puts letter_case_count_v2('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count_v2('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count_v2('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count_v2('') == { lowercase: 0, uppercase: 0, neither: 0 }

p letter_case_count_v2('abCdef 123')
p letter_case_count_v2('AbCd +Ef')
p letter_case_count_v2('123')
p letter_case_count_v2('')

puts letter_case_count_v3('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count_v3('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count_v3('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count_v3('') == { lowercase: 0, uppercase: 0, neither: 0 }

p letter_case_count_v3('abCdef 123')
p letter_case_count_v3('AbCd +Ef')
p letter_case_count_v3('123')
p letter_case_count_v3('')
