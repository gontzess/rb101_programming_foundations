# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

def rotate_array(ary)
  ary[1..-1] + [ary[0]]
end

def rotate_rightmost_digits(num, n)
  ary = num.to_s.chars
  ary[-n..-1] = rotate_array(ary[-n..-1])
  ary.join.to_i
end

def rotate_rightmost_chars(str, n)
  ary = str.chars
  ary[-n..-1] = rotate_array(ary[-n..-1])
  ary.join
end

def max_rotation(num)
  length = num.to_s.size
  length.downto(1) do |n|
    num = rotate_rightmost_digits(num, n)
  end
  num
end

# FURTHER EXPLORATION: There is an edge case in our problem when the number passed in as the argument has multiple consecutive zeros. Can you create a solution that preserves zeros?

def max_rotation_v2(num)
  str = num.to_s
  length = str.size
  length.downto(1) do |n|
    str = rotate_rightmost_chars(str, n)
  end
  str
end

def max_rotation_rec(num, n=num.to_s.size)
  return num if n == 1

  num = rotate_rightmost_digits(num, n)
  max_rotation_rec(num, n - 1)
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
puts max_rotation(120004)
puts max_rotation(105)
puts max_rotation(00405)

puts max_rotation_v2(735291) == 321579
puts max_rotation_v2(3) == 3
puts max_rotation_v2(35) == 53
puts max_rotation_v2(105) == 15 # the leading zero gets dropped
puts max_rotation_v2(8_703_529_146) == 7_321_609_845
puts max_rotation_v2(120004)
puts max_rotation_v2(105)
puts max_rotation_v2(00405)

puts max_rotation_rec(735291) == 321579
puts max_rotation_rec(3) == 3
puts max_rotation_rec(35) == 53
puts max_rotation_rec(105) == 15 # the leading zero gets dropped
puts max_rotation_rec(8_703_529_146) == 7_321_609_845
puts max_rotation_rec(120004)
puts max_rotation_rec(105)
puts max_rotation_rec(00405)
