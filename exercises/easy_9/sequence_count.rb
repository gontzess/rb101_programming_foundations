# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

def sequence(count, start_num)
  count == 0 ? ary = [] : ary = [start_num]
  (count - 1).times do
    ary << ary.last + start_num
  end
  ary
end

def sequence_v2(count, start_num)
  ary = []
  (1..count).each do |counter|
    ary << counter * start_num
  end
  ary
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []

p sequence(5, 1)
p sequence(4, -7)
p sequence(3, 0)
p sequence(0, 1000000)

puts sequence_v2(5, 1) == [1, 2, 3, 4, 5]
puts sequence_v2(4, -7) == [-7, -14, -21, -28]
puts sequence_v2(3, 0) == [0, 0, 0]
puts sequence_v2(0, 1000000) == []

p sequence_v2(5, 1)
p sequence_v2(4, -7)
p sequence_v2(3, 0)
p sequence_v2(0, 1000000)
