# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

def running_total(ary)
  ary_totals = []
  ary.inject(0) do |sum, num|
    sum += num
    ary_totals << sum
    sum
  end
  ary_totals
end

# LS solution, SOOO much cleaner!
def running_total_v2(ary)
  sum = 0
  ary.map { |num| sum += num }
end

# using each_with_object
def running_total_v3(ary)
  sum = 0
  ary.each_with_object([]) do |num, ary_totals|
    sum += num
    ary_totals << sum
  end
end

def running_total_v4(ary)
  ary.each_with_object([]) do |num, ary_totals|
    ary_totals << num + ary_totals.last.to_i
  end
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

puts running_total_v2([2, 5, 13]) == [2, 7, 20]
puts running_total_v2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total_v2([3]) == [3]
puts running_total_v2([]) == []

puts running_total_v3([2, 5, 13]) == [2, 7, 20]
puts running_total_v3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total_v3([3]) == [3]
puts running_total_v3([]) == []

puts running_total_v4([2, 5, 13]) == [2, 7, 20]
puts running_total_v4([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total_v4([3]) == [3]
puts running_total_v4([]) == []
