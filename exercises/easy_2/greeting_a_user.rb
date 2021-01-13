# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

def get_name
  print "What is your name? "
  name = gets.chomp.strip.capitalize
end

def display_greeting(name)
  name.end_with?('!') ? (puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?") : (puts "Hello #{name}.")
end

name = get_name
display_greeting(name)
