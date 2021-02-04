# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

inputs = { noun: '', verb: '', adjective: '', adverb: '' }

print "Enter a noun: "
inputs[:noun] = gets.chomp

print "Enter a verb: "
inputs[:verb] = gets.chomp

print "Enter an adjective: "
inputs[:adjective] = gets.chomp

print "Enter an adverb: "
inputs[:adverb] = gets.chomp

puts "I didn't realize that your #{inputs[:adjective]} #{inputs[:noun]} #{inputs[:verb]} #{inputs[:adverb]}!"
