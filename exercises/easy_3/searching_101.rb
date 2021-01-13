# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

numbers = []
count = %w(1st 2nd 3rd 4th 5th last)

count.each do |counter|
  puts "==> Enter the #{counter} number:"
  #numbers.push(gets.chomp.to_i)
  numbers << gets.chomp.to_i
end

last = numbers.pop

if numbers.include?(last)
  puts "The number #{last} appears in #{numbers}."
else
  puts "The number #{last} does not appear in #{numbers}."
end
