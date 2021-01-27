# Given the array below, Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash_v1 = flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name)
end

p flintstones_hash_v1

flintstones_hash_v2 = {}
flintstones.each_with_index do |name, index|
  flintstones_hash_v2[name] = index
end

p flintstones_hash_v2
