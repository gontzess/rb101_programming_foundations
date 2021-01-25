def sum_even_number_row(num)
  first = (num * (num - 1) + 2) / 2
  last = (num * (num + 1)) / 2
  (first..last).sum * 2
end

puts sum_even_number_row(2)
puts sum_even_number_row(3)
puts sum_even_number_row(4)
puts sum_even_number_row(5)
