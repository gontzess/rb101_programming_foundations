# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

print "Please write word or multiple words: "
words = gets.chomp

character_count = words.count("^ ")

puts "There are #{character_count} characters in \"#{words}\"."
