# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def divisible_by?(num, divisor)
  num % divisor == 0
end

def fizzbuzz(start_num, end_num)
  (start_num..end_num).each do |num|
    if divisible_by?(num, 3) && divisible_by?(num, 5)
      print 'FizzBuzz'
    elsif divisible_by?(num, 3)
      print 'Fizz'
    elsif divisible_by?(num, 5)
      print 'Buzz'
    else
      print num
    end
    print ', ' unless num == end_num
  end
  puts
end

def fizzbuzz_value(num)
  case
  when num % 3 == 0 && num % 5 == 0
    'FizzBuzz'
  when num % 3 == 0
    'Fizz'
  when num % 5 == 0
    'Buzz'
  else
    num
  end
end

def fizzbuzz_v2(start_num, end_num)
  results = []
  (start_num..end_num).each do |num|
    results << fizzbuzz_value(num)
  end
  puts results.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
fizzbuzz_v2(1, 15)
