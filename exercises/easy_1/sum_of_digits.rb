# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

def sum(num)
  digits = num.to_s.chars.map { |char| char.to_i }

  digits.reduce { |total, digit| total + digit }
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45




def add_elements(ary, sum=0)
  if ary.empty?
    sum
  else
    sum += ary.pop
    add_elements(ary, sum)
  end
end

def sum_challenge(num)
  add_elements(num.digits)
end

puts sum_challenge(496)
puts sum_challenge(23) == 5
puts sum_challenge(496) == 19
puts sum_challenge(123_456_789) == 45


def sum_challenge2(num, sum=0)
  ary = num.digits
  if ary.empty?
    sum
  else
    sum += ary.pop
    num = ary.join.to_i
    sum_challenge2(num, sum)
  end
end

puts sum_challenge2(496)
puts sum_challenge2(23) == 5
puts sum_challenge2(496) == 19
puts sum_challenge2(123_456_789) == 45
