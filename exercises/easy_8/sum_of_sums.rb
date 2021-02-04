# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

def sum_of_sums(ary)
  ary_dup = ary.clone
  total = 0

  loop do
    break if ary_dup.empty?
    total += ary_dup.sum
    ary_dup.pop
  end

  total
end

def sum_of_sums_vLS(ary)
  total = 0
  accumulator = 0

  ary.each do |num|
    accumulator += num
    total += accumulator
  end

  total
end

def sum_of_sums_v2(ary, total=0)
  if ary.length == 0
    total
  else
    ary = ary.clone
    total += ary.sum
    ary.pop
    sum_of_sums_v2(ary, total)
  end
end

def sum_of_sums_v3(ary)
  if ary.length == 1
    ary[0]
  else
    ary.sum + sum_of_sums_v3(ary[0..-2])
  end
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35

puts sum_of_sums_vLS([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums_vLS([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums_vLS([4]) == 4
puts sum_of_sums_vLS([1, 2, 3, 4, 5]) == 35

puts sum_of_sums_v2([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums_v2([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums_v2([4]) == 4
puts sum_of_sums_v2([1, 2, 3, 4, 5]) == 35

puts sum_of_sums_v3([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums_v3([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums_v3([4]) == 4
puts sum_of_sums_v3([1, 2, 3, 4, 5]) == 35
