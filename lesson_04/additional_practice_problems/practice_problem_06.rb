# Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each { |word| word.slice!(3..-1) }

p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |word| word[0..2] }

p flintstones
