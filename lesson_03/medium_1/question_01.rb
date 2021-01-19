# For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

=begin
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
=end

spacing = ""
phrase = "The Flintstones Rock!"
10.times do
  puts spacing + phrase
  spacing = spacing + " "
end


#LS Solution:
10.times do |num|
  puts (" " * num) + phrase
end
