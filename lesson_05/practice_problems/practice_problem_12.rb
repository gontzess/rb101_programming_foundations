# Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

=begin
hsh1 = arr.each_with_object({}) do |arr_pairs, hsh|
  key = arr_pairs[0]
  value = arr_pairs[1]
  hsh[key] = value
end
=end

#refactored:
hsh1 = arr.each_with_object({}) do |pairs, hsh|
  hsh[pairs[0]] = pairs[1]
end

p hsh1
p arr
