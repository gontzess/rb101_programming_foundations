# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade. Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

def get_grade(int1, int2, int3)
  score = (int1 + int2 + int3) / 3
  case score
  when 101...   then 'A+'
  when 90..100  then 'A'
  when 80...90  then 'B'
  when 70...80  then 'C'
  when 60...70  then 'D'
  else               'F'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
puts get_grade(99, 110, 99) == "A+"
puts get_grade(99, 110, 99)
