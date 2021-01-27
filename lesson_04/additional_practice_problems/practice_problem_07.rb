# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# ex: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

letter_count = Hash.new(0)

statement.each_char { |char| letter_count[char] += 1 unless char == ' '}

p letter_count


# LS version:

result = {}
statement.each_char do |char|
  next if char == ' '
  letter_frequency = statement.scan(char).count
  result[char] = letter_frequency if letter_frequency > 0
end

p result
