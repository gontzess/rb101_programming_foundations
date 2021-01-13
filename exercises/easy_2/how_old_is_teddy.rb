# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

# Example output: Teddy is 69 years old!

def get_name
  puts "Please enter your name."
  name = gets.chomp.strip.capitalize
  name = 'Teddy' if name.empty?
  name
end

def generate_rand_age
  rand(20..200)
end

def display_age(age, name)
  puts "#{name} is #{age} years old!"
end


name = get_name
age = generate_rand_age
display_age(age, name)
