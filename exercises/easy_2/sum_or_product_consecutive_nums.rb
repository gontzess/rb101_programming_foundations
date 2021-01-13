# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

def get_start_integer
  start_integer = ''
  loop do
    puts ">> Please enter an integer greater than 0:"
    start_integer = gets.chomp

    break if (start_integer.to_i.to_s == start_integer) && (start_integer.to_i > 0)

    puts ">> Invalid entry."
  end
  start_integer.to_i
end

def get_operation_choice
  operation = ''
  loop do
    puts ">> Enter 's' to compute the sum, 'p' to compute the product."
    operation = gets.chomp.downcase

    break if %w(s p).include?(operation)

    puts ">> Invalid entry."
  end
  operation
end

def calculate_sum(start_integer, sum=0)
  if start_integer == 0
    sum
  else
    sum += start_integer
    calculate_sum(start_integer - 1, sum)
  end
end

def calculate_product(start_integer, product=1)
  if start_integer == 1
    product
  else
    product *= start_integer
    calculate_product(start_integer - 1, product)
  end
end

def calculate_sum_alt(start_integer)
  (0..start_integer).inject(:+)
end

def calculate_product_alt(start_integer)
  (1..start_integer).inject(:*)
end

def display_sum_results(start_integer, sum)
  puts ">> The sum of the integers between 1 and #{start_integer} is #{sum}."
end

def display_product_results(start_integer, product)
  puts ">> The product of the integers between 1 and #{start_integer} is #{product}."
end

start_integer = get_start_integer
operation = get_operation_choice

if operation == 's'
  #sum = calculate_sum(start_integer)
  sum = calculate_sum_alt(start_integer)
  display_sum_results(start_integer, sum)
elsif operation == 'p'
  #product = calculate_product(start_integer)
  product = calculate_product_alt(start_integer)
  display_product_results(start_integer, product)
else
  puts ">> Error!"
end

puts ">> Goodbye."
