# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list. You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

=begin
def reverse(ary)
  reversed_ary = []
  reversed_ary.push(ary[ary.length / 2]) if ary.length.odd?

  left_counter = 0
  right_counter = -1

  loop do
    break if left_counter == ary.length / 2
    reversed_ary.push(ary[left_counter])
    reversed_ary.unshift(ary[right_counter])
    p reversed_ary

    left_counter += 1
    right_counter -= 1
  end

  reversed_ary
end
=end

def reverse_v2(ary)
  ary.each_with_object([]) { |element, reversed_ary| reversed_ary.unshift(element) }
end


puts reverse_v2([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse_v2(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse_v2(['abc']) == ['abc']              # => true
puts reverse_v2([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse_v2(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
