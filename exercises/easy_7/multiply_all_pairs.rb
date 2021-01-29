# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value. You may assume that neither argument is an empty Array.

def multiply_all_pairs(ary1, ary2)
  results = []
  ary1.each do |num1|
    ary2.each do |num2|
      results << num1 * num2
    end
  end
  results.sort
end

def multiply_all_pairs_v2(ary1, ary2)
  ary1.product(ary2).map { |num1, num2| num1 * num2 }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
p multiply_all_pairs([2, 4], [4, 3, 1, 2])

puts multiply_all_pairs_v2([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
p multiply_all_pairs_v2([2, 4], [4, 3, 1, 2])
