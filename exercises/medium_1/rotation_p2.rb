# Write a method that can rotate the last n digits of a number.

# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

def rotate_array(ary)
  ary[1..-1] + [ary[0]]
end


def rotate_rightmost_digits(num, length)
  ary = num.to_s.chars
  idx = 0 - length
  new_ary = ary[0...idx] + rotate_array(ary[idx..-1])
  new_ary.join.to_i
end

def rotate_rightmost_digits_vLS(num, n)
  ary = num.to_s.chars
  ary[-n..-1] = rotate_array(ary[-n..-1])
  ary.join.to_i
end


puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917

puts rotate_rightmost_digits(735291, 1)
puts rotate_rightmost_digits(735291, 2)
puts rotate_rightmost_digits(735291, 3)
puts rotate_rightmost_digits(735291, 4)
puts rotate_rightmost_digits(735291, 5)
puts rotate_rightmost_digits(735291, 6)

puts rotate_rightmost_digits_vLS(735291, 1) == 735291
puts rotate_rightmost_digits_vLS(735291, 2) == 735219
puts rotate_rightmost_digits_vLS(735291, 3) == 735912
puts rotate_rightmost_digits_vLS(735291, 4) == 732915
puts rotate_rightmost_digits_vLS(735291, 5) == 752913
puts rotate_rightmost_digits_vLS(735291, 6) == 352917
