# Build a program that displays when the user will retire and how many years she has to work till retirement.

CURRENT_YEAR = 2021

def get_current_age
  print "What is your age? "
  current_age = gets.chomp.to_i
end

def get_retirement_age
  print "At what age would you like to retire? "
  retirement_age = gets.chomp.to_i
end

def calculate_years_until_retirement(current_age, retirement_age)
  retirement_age - current_age
end

def calculate_retirement_year(years_until_retirement)
  CURRENT_YEAR + years_until_retirement
end

current_age = get_current_age
retirement_age = get_retirement_age
years_until_retirement = calculate_years_until_retirement(current_age, retirement_age)
retirement_year = calculate_retirement_year(years_until_retirement)

puts ""
puts "It's #{CURRENT_YEAR}. You will retire in #{retirement_year}."
puts "You have only #{years_until_retirement} years of work to go!"


# LS Solution uses:
# current_year = Time.now.year
