# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

arr2 = arr.sort do |el1, el2|
  el2.to_i <=> el1.to_i
end

p arr2
