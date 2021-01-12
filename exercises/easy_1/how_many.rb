# Write a method that counts the number of occurrences of each element in a given array.


def display_occurences(hash)
  hash.each { |k, v| puts "#{k} => #{v}"}
end

def count_occurrences(ary)
  occ = Hash.new
  ary.each do |element|
    if occ.include?(element)
      occ[element] += 1
    else
      occ[element] = 1
    end
  end
  display_occurences(occ)
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)



=begin
# LS Solution for algorithm
array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

=end
