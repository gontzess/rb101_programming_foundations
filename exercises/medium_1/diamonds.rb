# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

def row_string(half_length, row_num)
  str_seg = '*' * row_num + ' ' * (half_length - row_num)
  str_seg.reverse + '*' + str_seg
end

def diamond(n)
  half_length = (n - 1) / 2
  rows = (0..half_length).to_a + (0...half_length).to_a.reverse
  rows.each do |row|
    puts row_string(half_length, row)
  end
end

def row_string_v2(n, row_num)
  str_seg = '*' + '**' * row_num
  str_seg.center(n)
end

def diamond_v2(n)
  half_length = (n - 1) / 2
  rows = (0..half_length).to_a + (0...half_length).to_a.reverse
  rows.each do |row|
    puts row_string_v2(n, row)
  end
end

# Further Exploration: Try modifying your solution or our solution so it prints only the outline of the diamond:



# diamond(1)
# diamond(3)
# diamond(5)
# # diamond(9)
#
# # diamond_v2(1)
# # diamond_v2(3)
# diamond_v2(5)
# diamond_v2(9)

diamond_v3(5)
