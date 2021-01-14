# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power(num, n)
  if n > 0
    multiply(num, power(num, n - 1))
  elsif n < 0
    n *= -1
    1 / (power(num, n).to_f)
  else # so if n == 0
    1
  end
end

puts square(5) == 25
puts square(-8) == 64

puts power(2, 5)
puts power(2, -2)
puts power(2, 0)
