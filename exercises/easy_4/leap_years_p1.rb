# Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

def leap_year_v1?(year)
  return year % 4 == 0 unless year % 100 == 0
  #year % 100 == 0 && year % 400 == 0
  year % 400 == 0
end

def leap_year_v2?(year)
  (year % 4 == 0 && year % 100 != 0) || (year % 100 == 0 && year % 400 == 0)
end

def leap_year_vLS?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

=begin
puts leap_year?(2016) # ==> true
puts leap_year?(2015) # ==> false
puts leap_year?(2100) # ==> false
puts leap_year?(2400) # ==> true
puts leap_year?(240000) # ==> true
puts leap_year?(240001) # ==> false
puts leap_year?(2000) # ==> true
puts leap_year?(1900) # ==> false
puts leap_year?(1752) # ==> true
puts leap_year?(1700) # ==> false
puts leap_year?(1) # ==> false
puts leap_year?(100) # ==> false
puts leap_year?(400) # ==> true
=end

puts leap_year_v1?(2016) == true
puts leap_year_v1?(2015) == false
puts leap_year_v1?(2100) == false
puts leap_year_v1?(2400) == true
puts leap_year_v1?(240000) == true
puts leap_year_v1?(240001) == false
puts leap_year_v1?(2000) == true
puts leap_year_v1?(1900) == false
puts leap_year_v1?(1752) == true
puts leap_year_v1?(1700) == false
puts leap_year_v1?(1) == false
puts leap_year_v1?(100) == false
puts leap_year_v1?(400) == true

puts leap_year_vLS?(2016) == true
puts leap_year_vLS?(2015) == false
puts leap_year_vLS?(2100) == false
puts leap_year_vLS?(2400) == true
puts leap_year_vLS?(240000) == true
puts leap_year_vLS?(240001) == false
puts leap_year_vLS?(2000) == true
puts leap_year_vLS?(1900) == false
puts leap_year_vLS?(1752) == true
puts leap_year_vLS?(1700) == false
puts leap_year_vLS?(1) == false
puts leap_year_vLS?(100) == false
puts leap_year_vLS?(400) == true
