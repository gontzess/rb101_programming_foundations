# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

def stringy(num, starter=1)
  ary = []
  follower = starter == 1 ? 0 : 1
  (1..num).each do |idx|
    idx.odd? ? ary.push(starter) : ary.push(follower)
  end
  ary.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


puts stringy(6)
puts stringy(9)
puts stringy(4, 1)
puts stringy(7)

puts stringy(6, 0)
puts stringy(9, 0)
puts stringy(4, 0)
puts stringy(7, 0)
