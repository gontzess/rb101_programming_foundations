# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

# fib(n) = fib(n-1) + fib(n-2)


# fib with simple recursion
def fibonacci_v1(n)
  return n if n < 2
  fibonacci_v1(n - 1) + fibonacci_v1(n - 2)
end

# fib with tail recursion
def fibonacci_v2(n, a0=0, a1=1)
  if n == 0
    a0
  elsif n == 1
    a1
  else
    fibonacci_v2(n - 1, a1, a1 + a0)
  end
end

p fibonacci_v1(0) == 0
p fibonacci_v1(1) == 1
p fibonacci_v1(2) == 1
p fibonacci_v1(3) == 2
p fibonacci_v1(4) == 3
p fibonacci_v1(5) == 5
p fibonacci_v1(12) == 144
p fibonacci_v1(20) == 6765

p fibonacci_v2(0) == 0
p fibonacci_v2(1) == 1
p fibonacci_v2(2) == 1
p fibonacci_v2(3) == 2
p fibonacci_v2(4) == 3
p fibonacci_v2(5) == 5
p fibonacci_v2(12) == 144
p fibonacci_v2(20) == 6765
