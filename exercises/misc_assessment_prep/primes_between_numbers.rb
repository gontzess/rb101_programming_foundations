# Write a method that takes two numbers. Return an array containing all primes between the two numbers (include the two given numbers in your answer if they are prime). Don't use Ruby's 'prime' class.

# A prime number is a natural number greater than 1 that is not a product of two smaller natural numbers.

def not_prime?(int)
  return true if int <= 1

  (2...int).any? do |num|
    int % num == 0
  end
end

def prime?(int)
  !not_prime?(int)
end

def find_primes(num1, num2)
  (num1..num2).select { |num| prime?(num) }
end

p find_primes(3, 10) == [3, 5, 7]
p find_primes(11, 20) == [11, 13, 17, 19]
p find_primes(100, 101) == [101]
p find_primes(1, 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
p find_primes(1, 2) == [2]

# p prime?(1) == false
# p prime?(2) == true
# p prime?(3) == true
# p prime?(4) == false
# p prime?(5) == true
# p prime?(6) == false
# p prime?(7) == true
# p prime?(8) == false
# p prime?(9) == false
