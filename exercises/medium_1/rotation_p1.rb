# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(ary)
  ary[1..-1] + [ary[0]]
end

# FURTHER EXPLORATION: Write a method that rotates a string instead of an array. Do the same thing for integers. You may use rotate_array from inside your new method.

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integer(num)
  # rotate_array(num.digits.reverse).join.to_i
  rotate_string(num.to_s).to_i
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true

y = 'string'
puts rotate_string(y) == 'trings'   # => true
puts y == 'string'                # => true

z = 5438
puts rotate_integer(z) == 4385
puts z == 5438
