# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

MAX = 9_876_543_210

def digits_occur_once?(num)
  char_ary = num.to_s.chars.sort
  char_ary == char_ary.uniq
end

def featured(int)
  return nil if int >= MAX
  ((int + 1)..MAX).each do |num|
    if num.odd? && num % 7 == 0 && digits_occur_once?(num)
      return num
    end
  end
  nil
end

def featured_v2(int)
  return nil if int >= MAX

  loop do
    int += 1
    break if int.odd? && int % 7 == 0
  end

  int.step(to: MAX, by: 14) do |num|
    return num if digits_occur_once?(num)
  end
  nil
end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987
#
# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

p featured_v2(12) == 21
p featured_v2(20) == 21
p featured_v2(21) == 35
p featured_v2(997) == 1029
p featured_v2(1029) == 1043
p featured_v2(999_999) == 1_023_547
p featured_v2(999_999_987) == 1_023_456_987

p featured_v2(9_999_999_999) # -> There is no possible number that fulfills those requirements
