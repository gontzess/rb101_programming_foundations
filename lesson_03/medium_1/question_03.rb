# Alan wrote the following method, which was intended to show all of the factors of the input number. Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using begin/end/until? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.


def factors(number)
  return "Try again with a positive number." if number <= 0
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

def factors_v2(number)
  return "Try again with a positive number." if number <= 0
  factors = []
  number.downto(1).each do |divisor|
    factors << number / divisor if number % divisor == 0
  end
  factors
end

def factors_vLS(number)
  return "Try again with a positive number." if number <= 0
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

puts factors(20)
puts factors(-20)

puts factors_v2(20)
puts factors_v2(-20)

puts factors_vLS(20)
puts factors_vLS(-20)
