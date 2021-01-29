# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

def triangle(n)
  str = ' ' * n
  loop do
    break if n <= 0
    str[n - 1] = '*'
    puts str
    n -= 1
  end
end

def triangle_vLS(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

# FURTHER EXPLORATION: Try modifying your solution so it prints the triangle upside down from its current orientation. Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

def triangle_to_array(n)
  str = ' ' * n
  triangle_ary = []
  loop do
    break if n <= 0
    str[n - 1] = '*'
    triangle_ary << str.chars
    n -= 1
  end
  triangle_ary
end

def format_quadrant(triangle_ary, r_angle_quadrant)
  case r_angle_quadrant
  when 1
    triangle_ary.reverse
  when 2
    triangle_ary.reverse.map { |row| row.reverse }
  when 3
    triangle_ary.map { |row| row.reverse }
  when 4
    triangle_ary
  else
    [%w(E R R O R)]
  end
end

def print_triangle(triangle_array)
  triangle_array.each { |row| puts row.join }
end

def triangle_v2(n, r_angle_quadrant=4)
  ary = format_quadrant(triangle_to_array(n), r_angle_quadrant)
  print_triangle(ary)
end

#triangle(5)
#triangle(9)
#triangle_vLS(5)
#triangle_vLS(9)

triangle_v2(5)
triangle_v2(5, 1)
triangle_v2(5, 2)
triangle_v2(5, 3)
triangle_v2(5, 4)

triangle_v2(9)
triangle_v2(9, 1)
triangle_v2(9, 2)
triangle_v2(9, 3)
triangle_v2(9, 4)
triangle_v2(9, 5)
