# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

def fibonacci(n)
  return n if n < 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

def fibonacci_tail(n, fib0, fib1)
  if n == 0
    fib0
  elsif n == 1
    fib1
  else
    fibonacci_tail(n - 1, fib1, fib1 + fib0)
  end
end

def fibonacci_v2(n)
  fibonacci_tail(n, 0, 1)
end

def fibonacci_v3(n, fib0=0, fib1=1)
  if n == 0
    fib0
  elsif n == 1
    fib1
  else
    fibonacci_v3(n - 1, fib1, fib1 + fib0)
  end
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765

puts fibonacci_v2(1) == 1
puts fibonacci_v2(2) == 1
puts fibonacci_v2(3) == 2
puts fibonacci_v2(4) == 3
puts fibonacci_v2(5) == 5
puts fibonacci_v2(12) == 144
puts fibonacci_v2(20) == 6765

puts fibonacci_v3(1) == 1
puts fibonacci_v3(2) == 1
puts fibonacci_v3(3) == 2
puts fibonacci_v3(4) == 3
puts fibonacci_v3(5) == 5
puts fibonacci_v3(12) == 144
puts fibonacci_v3(20) == 6765
