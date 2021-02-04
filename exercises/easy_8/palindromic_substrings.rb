# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def leading_substrings_rec(str, total=[])
  if str.length > 1
    leading_substrings_rec(str.chop, total)
  end
  total << str
end

def substrings_rec(str, total=[])
  leading_substrings_rec(str, total)
  if str.length > 1
    substrings_rec(str.reverse.chop.reverse, total)
  end
  total
end

def palindromes(str)
  substrings_rec(str).select do |substring|
    substring.length >= 2 && substring == substring.reverse
  end
end

# FURTHER EXPLORATION: Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.

def palindrome?(str)
  str = str.downcase.delete("^a-zA-Z0-9_")
  str.length >= 2 && str == str.reverse
end

def palindromes_v2(str)
  substrings_rec(str).select do |substring|
    palindrome?(substring)
  end
end


puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

p palindromes('abcd')
p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')

p palindromes_v2('abcd')
p palindromes_v2('madam')
p palindromes_v2('Mada-m-')
p palindromes_v2('hello-madam-did-madam-goodbye')
p palindromes_v2('knitting cassettes')
