# practice problem from study group

# def not_prime_old?(num)
#   return true if num == 1
#
#   (2...num).any? do |x|
#     x = x.to_f
#     num % x == 0.0
#   end
# end

def not_prime?(num)
  return true if num == 1

  (2...num).any? do |x|
    num % x == 0
  end
end

# def prime?(num)
#   !not_prime?(num)
# end


def odd_not_prime(num)
  ary = (1..num).select do |x|
    x.odd? && not_prime?(x)
  end
  ary.length
end


puts prime?(1)
puts prime?(2)
puts prime?(3)
puts prime?(4)
puts prime?(5)
puts prime?(6)
puts prime?(7)
puts prime?(8)
puts prime?(9)

p odd_not_prime(15) #== 3
p odd_not_prime(48) #== 10
p odd_not_prime(82) #== 20
