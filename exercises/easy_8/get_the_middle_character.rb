# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

def center_of(str)
  case
  when str.length.odd? then str[(str.length / 2)]
  when str.length.even? then str[(str.length / 2) - 1, 2]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'

puts center_of('I love ruby')
puts center_of('Launch School')
puts center_of('Launch')
puts center_of('Launchschool')
puts center_of('x')
