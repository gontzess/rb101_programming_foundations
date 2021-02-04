# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

def leading_substrings(str)
  substrings = []
  (0..(str.length - 1)).each do |idx|
    substrings << str[0..idx]
  end
  substrings
end

def substrings(str)
  substrings = []
  (0..(str.length - 1)).each do |idx|
    substrings << leading_substrings(str[idx..-1])
  end
  substrings.flatten
end


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

=begin
def substrings_rec(str, total=[])
  if str.length > 1
    leading_substrings_rec(str, total) + substrings_rec(str[1..-1], total)
  end
  total << str
end
=end


puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings('abcde')


p substrings_rec('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
p substrings_rec('abcde')
