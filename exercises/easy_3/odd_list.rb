# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

def oddities(ary)
  ary_odd = []
  ary.each_with_index { |e, i| ary_odd << e if (i + 1).odd? }
  ary_odd
end

def evens(ary)
  ary_even = []
  ary.each_with_index { |e, i| ary_even << e if (i + 1).even? }
  ary_even
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

p oddities([2, 3, 4, 5, 6])
p oddities([1, 2, 3, 4, 5, 6])
p oddities(['abc', 'def'])
p oddities([123])
p oddities([])

p evens([2, 3, 4, 5, 6])
p evens([1, 2, 3, 4, 5, 6])
p evens(['abc', 'def'])
p evens([123])
p evens([])
