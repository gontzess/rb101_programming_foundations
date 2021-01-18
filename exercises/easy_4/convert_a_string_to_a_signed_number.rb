# Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading + or - sign; if the first character is a +, your method should return a positive number; if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

STRING_DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_signed_integer(str)
  n = str.length - 1
  digit_values = []
  sign = 1
  str.each_char do |char|
    if char == '+' || char == '-'
      sign *= -1 if char == '-'
      n -= 1
      next
    else
      digit_values << STRING_DIGITS[char] * (10**n)
      n -= 1
    end
  end
  digit_values.sum * sign
end

#LS Solution / Further Exploration Refactoring
def string_to_integer(str)
  n = str.length - 1
  digit_values = []
  str.each_char do |char|
    digit_values << STRING_DIGITS[char] * (10**n)
    n -= 1
  end
  digit_values.sum
end

def string_to_signed_integer_LS(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

#V2 cleaned up
def string_to_signed_integer_v2(str)
  sign = str[0] == '-' ? -1 : 1
  str = str.delete("+-")
  string_to_integer(str) * sign
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

puts string_to_signed_integer_LS('4321') == 4321
puts string_to_signed_integer_LS('-570') == -570
puts string_to_signed_integer_LS('+100') == 100

puts string_to_signed_integer_v2('4321') == 4321
puts string_to_signed_integer_v2('-570') == -570
puts string_to_signed_integer_v2('+100') == 100
