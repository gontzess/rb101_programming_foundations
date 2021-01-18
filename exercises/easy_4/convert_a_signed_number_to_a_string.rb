# Write a method that takes an integer, and converts it to a string representation. You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

NUM_CHARS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5' , 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(num)
  string = ''
  loop do
    digit_value = num % 10
    string.prepend(NUM_CHARS[digit_value])
    num = (num - digit_value) / 10
    break if num == 0
  end
  string
end

def signed_integer_to_string(num)
  sign = if num < 0
           '-'
         elsif num > 0
           '+'
         else
           ''
         end
  sign + integer_to_string(num.abs)
end

def signed_integer_to_string_v2(num)
  sign = case num <=> 0
         when -1 then '-'
         when +1 then '+'
         else         ''
         end
  sign + integer_to_string(num.abs)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

puts signed_integer_to_string_v2(4321) == '+4321'
puts signed_integer_to_string_v2(-123) == '-123'
puts signed_integer_to_string_v2(0) == '0'
