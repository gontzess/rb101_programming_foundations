# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

def fibonacci(n)
  return n if n < 2
  last_two_fib = [0, 1]

  (n - 1).times do
    last_two_fib = [last_two_fib.last, last_two_fib.last + last_two_fib.first]
  end
  last_two_fib.last
end

def fibonacci_v2(n, fib0=0, fib1=1)
  if n == 0
    fib0
  elsif n == 1
    fib1
  else
    fibonacci_v2(n - 1, fib1, fib1 + fib0)
  end
end

def fibonacci_last_v1(n)
  fibonacci(n) % 10
end

def fibonacci_last_v2(n)
  return n if n < 2
  last_two_fib = [0, 1]

  (n - 1).times do
    last_two_fib = [last_two_fib.last, (last_two_fib.last + last_two_fib.first) % 10]
  end
  last_two_fib.last
end

# FURTHER EXPLORATION: After a while, even this method starts to take too long to compute results. Can you provide a solution to this problem that will work no matter how big the number? You should be able to return results almost instantly.

LAST_DIGIT = [0, 1, 1, 2, 3, 5, 8, 3, 1, 4, 5, 9, 4, 3, 7, 0, 7, 7, 4, 1, 5, 6, 1, 7, 8, 5, 3, 8, 1, 9, 0, 9, 9, 8, 7, 5, 2, 7, 9, 6, 5, 1, 6, 7, 3, 0, 3, 3, 6, 9, 5, 4, 9, 3, 2, 5, 7, 2, 9, 1]

def fibonacci_last_v3(n)
  LAST_DIGIT[n % 60]
end

# puts fibonacci(0)
# puts fibonacci(1)
# puts fibonacci(2)
# puts fibonacci(3)
# puts fibonacci(4)
# puts fibonacci(5)
#
# puts fibonacci_v2(0)
# puts fibonacci_v2(1)
# puts fibonacci_v2(2)
# puts fibonacci_v2(3)
# puts fibonacci_v2(4)
# puts fibonacci_v2(5)

# puts fibonacci_last_v2(15)        # -> 0  (the 15th Fibonacci number is 610)
# puts fibonacci_last_v2(20)        # -> 5 (the 20th Fibonacci number is 6765)
# puts fibonacci_last_v2(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# puts fibonacci_last_v2(100_001)   # -> 1 (this is a 20899 digit number)
# puts fibonacci_last_v2(1_000_007) # -> 3 (this is a 208989 digit number)
# puts fibonacci_last_v2(123456789) # -> 4

puts fibonacci_last_v3(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last_v3(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last_v3(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last_v3(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last_v3(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last_v3(123456789) # -> 4
puts fibonacci_last_v3(0)
puts fibonacci_last_v3(60)
puts fibonacci_last_v3(61)
