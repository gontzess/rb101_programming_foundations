# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object. You may not use Array#reverse or Array#reverse!.

def reverse!(ary)
  left_counter = 0
  right_counter = -1

  loop do
    break if left_counter == ary.length / 2
    ary[left_counter], ary[right_counter] = ary[right_counter], ary[left_counter]
    left_counter += 1
    right_counter -= 1
  end

  ary
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true
