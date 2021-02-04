# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

def leading_substrings(str)
  substrings = []
  str.each_char.with_index do |_, idx|
    substrings << str[0..idx]
  end
  substrings
end

def leading_substrings_v2(str, total=[])
  if str.length == 0
    total.reverse
  else
    total += [str]
    leading_substrings_v2(str[0..-2], total)
  end
end

def leading_substrings_v3(str, total=[])
  if str.length > 1
    leading_substrings_v3(str[0..-2], total)
  end
  total << str
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

p leading_substrings_v2('abc')
p leading_substrings_v2('a')
p leading_substrings_v2('xyzzy')

puts leading_substrings_v2('abc') == ['a', 'ab', 'abc']
puts leading_substrings_v2('a') == ['a']
puts leading_substrings_v2('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

p leading_substrings_v3('abc')
p leading_substrings_v3('a')
p leading_substrings_v3('xyzzy')
