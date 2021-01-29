# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

def include?(ary, value)
  result = false
  ary.find { |element| result = true if element == value }
  result
end

def include_vLS?(ary, value)
  !!ary.find_index(value)
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

puts include_vLS?([1,2,3,4,5], 3) == true
puts include_vLS?([1,2,3,4,5], 6) == false
puts include_vLS?([], 3) == false
puts include_vLS?([nil], nil) == true
puts include_vLS?([], nil) == false
