# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(n)
  return n if n < 2

  fib0 = 0
  fib1 = 1
  fibn = fib0 + fib1

  (n - 2).times do
    fib0 = fib1
    fib1 = fibn
    fibn = fib0 + fib1
  end

  fibn
end

def fibonacci_v2(n)
  return n if n < 2

  fib0, fib1 = [0, 1]

  (n - 1).times do
    fib0, fib1 = [fib1, fib0 + fib1]
  end

  fib1
end



puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
# puts fibonacci(100_001) # => 4202692702.....8285979669707537501

puts fibonacci_v2(20) == 6765
puts fibonacci_v2(100) == 354224848179261915075
# puts fibonacci_v2(100_001) # => 4202692702.....8285979669707537501

puts fibonacci_v2(0)
puts fibonacci_v2(1)
puts fibonacci_v2(2)
puts fibonacci_v2(3)
puts fibonacci_v2(4)
puts fibonacci_v2(5)
