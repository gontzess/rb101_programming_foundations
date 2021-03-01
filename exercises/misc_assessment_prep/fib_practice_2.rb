# Select the element out of the array if its index is a fibonacci number.
# Fibonacci sequence.
# The sequence is a series of numbers characterized by the fact that every number is the sum of the two numbers preceding it in the sequence.

def fibonacci_v1(n)
  return n if n < 2
  fibonacci_v1(n - 1) + fibonacci_v1(n - 2)
end

def fibonacci_v2(n, a0=0, a1=1)
  if n == 0
    a0
  elsif n == 1
    a1
  else
    fibonacci_v2(n - 1, a1, a1 + a0)
  end
end

def fib_index_select(ary)
  fib_ary = (0..15).map { |n| fibonacci_v2(n) }
  ary.select.with_index do |_, idx|
    fib_ary.include?(idx)
  end
end

p fib_index_select([1, 2, 3, 4, 5, 6])
p fib_index_select(('a'..'z').to_a)

# p fibonacci_v1(0)
# p fibonacci_v1(1)
# p fibonacci_v1(2)
# p fibonacci_v1(3)
# p fibonacci_v1(4)
# p fibonacci_v1(5)
# p fibonacci_v1(6)
# p fibonacci_v1(7)
# p fibonacci_v1(8)
# p fibonacci_v1(9)

# p fibonacci_v2(0)
# p fibonacci_v2(1)
# p fibonacci_v2(2)
# p fibonacci_v2(3)
# p fibonacci_v2(4)
# p fibonacci_v2(5)
# p fibonacci_v2(6)
# p fibonacci_v2(7)
# p fibonacci_v2(8)
# p fibonacci_v2(9)
