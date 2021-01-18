# show two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."

puts famous_words.prepend("Four score and ")  # modifies the caller
puts "Four score and " + famous_words
