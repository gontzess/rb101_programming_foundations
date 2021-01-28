# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

def merge(ary1, ary2)
  #ary1.union(ary2)
  ary1 | ary2
end

# Using this method for set union is convenient, but what if we didn't have it? There are certainly a few other ways to go about solving this exercise.

def merge_v2(ary1, ary2)
  (ary1 + ary2).uniq
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
puts merge_v2([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
