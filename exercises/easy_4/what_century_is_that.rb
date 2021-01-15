# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

ENDINGS = %w(th st nd rd th th th th th th)
ENDINGS_TEENS = 'th'

def ending(century)
  if (11..13).include?(century.remainder(100))
    ENDINGS_TEENS
  else
    ENDINGS[century.remainder(10)]
  end
end

def century(year)
  century = ((year - 1) / 100 ) + 1
  century.to_s + ending(century)
end


puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

puts century(2000)
puts century(1999)
puts century(2001)
puts century(2002)
puts century(1965)
puts century(256)
puts century(5)
puts century(10103)
puts century(1052)
puts century(1127)
puts century(11201)
