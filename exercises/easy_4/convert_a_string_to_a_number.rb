# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above. (to_i or integer())

STRING_DIGITS = %w(0 1 2 3 4 5 6 7 8 9)
HEX_DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14,
  'F' => 15 }

def string_to_integer(str)
  n = str.length - 1
  digit_values = []
  str.each_char do |char|
    digit_values << STRING_DIGITS.index(char) * (10**n)
    n -= 1
  end
  digit_values.sum
end

def hexadecimal_to_integer(str)
  sum = 0
  str.chars.each_with_index do |char, idx|
    if idx == 0
      sum = HEX_DIGITS[char.upcase]
    else
      sum = (sum * 16) + HEX_DIGITS[char.upcase]
    end
  end
  sum
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

puts hexadecimal_to_integer('4D9f') == 19871
puts hexadecimal_to_integer('3425') == 13349
