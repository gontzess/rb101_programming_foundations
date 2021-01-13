# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

OPERATIONS = [:+, :-, :*, :/, :%, :**]

puts "==> Enter the first number:"
num1 = gets.chomp.to_i

puts "==> Enter the second number:"
num2 = gets.chomp.to_i

OPERATIONS.each do |op|
  result = num1.send(op, num2)
  puts "==> #{num1} #{op} #{num2} = #{result}"
end
