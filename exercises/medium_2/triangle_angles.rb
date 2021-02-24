# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

def is_triangle?(angles)
  angles.sum == 180 && angles.all?(&:positive?)
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3].sort

  return :invalid if !is_triangle?(angles)

  case angles.last <=> 90
  when -1 then :acute
  when 0 then :right
  when 1 then :obtuse
  else puts "ErRoR!"
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
