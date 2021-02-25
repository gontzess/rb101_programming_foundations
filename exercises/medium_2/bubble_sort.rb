# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

def bubble_sort!(array)
  loop do
    counter = 0
    (1..array.length - 1).each do |idx|
      if array[idx - 1] > array[idx]
        array[idx - 1], array[idx] = array[idx], array[idx - 1]
        counter += 1
      end
    end
    break if counter == 0
  end
  array
end

def bubble_sort_opt!(array)
  n = array.length
  loop do
    counter = 0
    (1..n - 1).each do |idx|
      if array[idx - 1] > array[idx]
        array[idx - 1], array[idx] = array[idx], array[idx - 1]
        counter += 1
      end
    end
    n -= 1
    break if counter == 0
  end
  array
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


array = [5, 3]
bubble_sort_opt!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort_opt!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort_opt!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
