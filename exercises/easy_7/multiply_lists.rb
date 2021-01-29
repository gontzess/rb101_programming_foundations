# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

def multiply_list(ary1, ary2)
  ary1.zip(ary2).each_with_object([]) { |pair, results| results << pair[0] * pair[1] }
end

def multiply_list_v2(ary1, ary2)
  ary1.zip(ary2).map { |num1, num2| num1 * num2 }
end

def multiply_list_v3(ary1, ary2)
  ary1.zip(ary2).map { |pair| pair.inject(:*) }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list([3, 5, 7], [9, 10, 11])

puts multiply_list_v2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list_v2([3, 5, 7], [9, 10, 11])

puts multiply_list_v3([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list_v3([3, 5, 7], [9, 10, 11])
