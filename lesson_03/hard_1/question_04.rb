# Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.

def dot_separated_ip_address_old?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)." Help Ben fix his code.

def is_an_ip_number?(word)
  word.to_i > 0 && word.to_i < 255
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

def dot_separated_ip_address_v2?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.length != 4

  dot_separated_words.each do |word|
    is_an_ip_number?(word) ? (next) : (return false)
  end

  true
end

puts dot_separated_ip_address?("10.4.5.11")
puts dot_separated_ip_address?("4.5.5")
puts dot_separated_ip_address?("1.2.3.4.5")

puts dot_separated_ip_address_v2?("10.4.5.11")
puts dot_separated_ip_address_v2?("4.5.5")
puts dot_separated_ip_address_v2?("1.2.3.4.5")