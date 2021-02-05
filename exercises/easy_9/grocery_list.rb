# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

def buy_fruit(ary)
  ary_list = []
  ary.each do |(fruit, count)|
    count.times { ary_list << fruit }
  end
  ary_list
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
