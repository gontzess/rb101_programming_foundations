# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end


puts ['ant', 'bat', 'caterpillar'].count { |str| str.length < 4 }

puts ['ant', 'bat', 'caterpillar'].count { |str| 'hi' }


# count evaluates the truthiness of the blocks return value then sums the number of truthinesses
