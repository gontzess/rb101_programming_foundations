# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

def read_sentences(file_location_str)
  content = File.read(file_location_str)
  content.gsub(/[\t\r\n\f\v]/, " ").gsub(/  */, " ").split(/\. |\? |\! /)
end

def word_count(sentence)
  sentence.split.size
end

def longest_sentence(file_location_str)
  sentences = read_sentences(file_location_str)
  longest = sentences.inject do |longest, sentence|
              word_count(longest) >= word_count(sentence) ? longest : sentence
            end
  puts "=> Longest sentence is:"
  puts "=> #{longest}."
  puts "=> Word count is: #{word_count(longest)}"
end

## version 2
def read_sentences_v2(file_location_str)
  content = File.read(file_location_str)
  content.split(/\.|\?|\!/)
end

def longest_sentence_v2(file_location_str)
  sentences = read_sentences_v2(file_location_str)
  longest = sentences.max_by { |sentence| sentence.split.size }
  longest = longest.split.map(&:strip).join(" ") + "."
  count = longest.split.size
  puts "=> Longest sentence is:"
  puts "=> #{longest}"
  puts "=> Word count is: #{count}"
end


# longest_sentence("sample_text_1.txt")
# longest_sentence("sample_text_2.txt")

longest_sentence_v2("sample_text_1.txt")
longest_sentence_v2("sample_text_2.txt")
