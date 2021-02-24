# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

def is_triangle?(a, b, c)
  (a + b) > c && [a, b, c].all?(&:positive?)
end

def triangle(length1, length2, length3)
  sides = [length1, length2, length3].sort
  a, b, c = sides

  return :invalid if !is_triangle?(a, b, c)

  case sides.uniq.length
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
