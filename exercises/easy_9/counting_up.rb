# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument. You may assume that the argument will always be a valid integer that is greater than 0.

def sequence(num)
  (1..num).to_a
end

# FURTHER EXPLORATION: Food for thought: what do you think sequence should return if the argument is not greater than 0. For instance, what should you do if the argument is -1? Can you alter your method to handle this case?

def sequence_v2(num)
  num > 0 ? (1..num).to_a : (num..1).to_a
end

def sequence_v3(num)
  if num > 0
    (1..num).to_a
  else
    (1..num.abs).to_a.reverse.map { |x| -x } + [0, 1]
  end
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]

puts sequence_v2(5) == [1, 2, 3, 4, 5]
puts sequence_v2(3) == [1, 2, 3]
puts sequence_v2(1) == [1]
p sequence_v2(-5)
p sequence_v2(-1)
p sequence_v2(1)
p sequence_v2(0)
