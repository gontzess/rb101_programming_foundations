# Write a method that takes a positive integer or zero, and converts it to a string representation. You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

NUM_CHARS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5' , 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(num)
  chars_ary = []
  loop do
    digit_value = num % 10
    chars_ary.unshift(NUM_CHARS[digit_value])
    num = (num - digit_value) / 10
    break if num == 0
  end
  chars_ary.join
end


puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

puts integer_to_string(4321)
puts integer_to_string(0)
puts integer_to_string(5000)


# LS learning -- you can use prepend on string (mutating) so can skip the step of creating an array and then joining.
