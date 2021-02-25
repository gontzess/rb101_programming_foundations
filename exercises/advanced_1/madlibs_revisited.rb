# Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

def madlibs(file_location_string)
  adjectives = %w(quick lazy sleepy ugly).shuffle
  nouns = %w(fox dog head leg).shuffle
  verbs = %w(jumps lifts bites licks).shuffle
  adverbs = %w(easily lazily noisily excitedly).shuffle

  text = File.readlines(file_location_string, chomp: true)
  text.map! do |line|
    line.gsub('%{adjective}', adjectives.pop)
        .gsub('%{noun}', nouns.pop)
        .gsub('%{verb}', verbs.pop)
        .gsub('%{adverb}', adverbs.pop)
  end

  text.each { |line| puts line }
end

madlibs("madlibs_data.txt")
