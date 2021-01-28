# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

def find_fibonacci_index_by_length_v4(length)
  fibonacci = [0, 1, 1]
  index = 3

  loop do
    fib_at_index = fibonacci[index - 1] + fibonacci[index - 2]
    break if fib_at_index.to_s.length == length

    fibonacci.push(fib_at_index)
    index += 1
  end
  
  index
end

def find_fibonacci_index_by_length_vLS(length)
  fib_n_minus_one = 1
  fib_n_minus_two = 1
  index = 3

  loop do
    fib_n = fib_n_minus_one + fib_n_minus_two
    break if fib_n.to_s.length >= length

    fib_n_minus_two = fib_n_minus_one
    fib_n_minus_one = fib_n
    index += 1
  end

  index
end

=begin
def fibonacci(n)
  case n
  when 0 then 0
  when 1 then 1
  else fibonacci(n - 1) + fibonacci(n - 2)
  end
end

def fibonacci_length(n)
  fib = case n
        when 0 then 0
        when 1 then 1
        else fibonacci(n - 1) + fibonacci(n - 2)
        end
  fib.to_s.length
end

def find_fibonacci_index_by_length(length)
  index = 0
  loop do
    fib = fibonacci(index)
    break if fib.to_s.length == length
    index += 1
  end
  index
end

# FIBONACCI_SEQUENCE = (0..).map { |n| fibonacci(n) }

def find_fibonacci_index_by_length_v2(length)
  FIBONACCI_SEQUENCE.bsearch { |fib| fib.to_s.length == length }
end

def find_fibonacci_index_by_length_v3(length)
  index = 0
  loop do
    break if fibonacci_length(index) == length
    index += 1
  end
  index
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(3) == 12
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847


puts find_fibonacci_index_by_length(2)
puts find_fibonacci_index_by_length(3)
puts find_fibonacci_index_by_length(10)
puts find_fibonacci_index_by_length(100)
puts find_fibonacci_index_by_length(1000)
puts find_fibonacci_index_by_length(10000)

puts find_fibonacci_index_by_length_v3(2) == 7
puts find_fibonacci_index_by_length_v3(3) == 12
puts find_fibonacci_index_by_length_v3(10) == 45
puts find_fibonacci_index_by_length_v3(100) == 476
puts find_fibonacci_index_by_length_v3(1000) == 4782
puts find_fibonacci_index_by_length_v3(10000) == 47847


puts find_fibonacci_index_by_length_v3(2)
puts find_fibonacci_index_by_length_v3(3)
puts find_fibonacci_index_by_length_v3(10)
puts find_fibonacci_index_by_length_v3(100)
puts find_fibonacci_index_by_length_v3(1000)
puts find_fibonacci_index_by_length_v3(10000)


puts find_fibonacci_index_by_length_v4(2) == 7
puts find_fibonacci_index_by_length_v4(3) == 12
puts find_fibonacci_index_by_length_v4(10) == 45
puts find_fibonacci_index_by_length_v4(100) == 476
puts find_fibonacci_index_by_length_v4(1000) == 4782
puts find_fibonacci_index_by_length_v4(10000) == 47847


puts find_fibonacci_index_by_length_v4(2)
puts find_fibonacci_index_by_length_v4(3)
puts find_fibonacci_index_by_length_v4(10)
puts find_fibonacci_index_by_length_v4(100)
puts find_fibonacci_index_by_length_v4(1000)
puts find_fibonacci_index_by_length_v4(10000)
=end

puts find_fibonacci_index_by_length_vLS(2) == 7
puts find_fibonacci_index_by_length_vLS(3) == 12
puts find_fibonacci_index_by_length_vLS(10) == 45
puts find_fibonacci_index_by_length_vLS(100) == 476
puts find_fibonacci_index_by_length_vLS(1000) == 4782
puts find_fibonacci_index_by_length_vLS(10000) == 47847


puts find_fibonacci_index_by_length_vLS(2)
puts find_fibonacci_index_by_length_vLS(3)
puts find_fibonacci_index_by_length_vLS(10)
puts find_fibonacci_index_by_length_vLS(100)
puts find_fibonacci_index_by_length_vLS(1000)
puts find_fibonacci_index_by_length_vLS(10000)
