# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

def crunch(phrase)
  cleaned_chars = []
  phrase.each_char do |char|
    cleaned_chars.push(char) unless cleaned_chars.last == char
  end
  cleaned_chars.join
end

def crunch_regexp(phrase)
  phrase.gsub(/(.)\1+/, '\1')
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''

puts crunch('ddaaiillyy ddoouubbllee')
puts crunch('4444abcabccba')
puts crunch('ggggggggggggggg')
puts crunch('a')
puts crunch('')


puts crunch_regexp('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch_regexp('4444abcabccba') == '4abcabcba'
puts crunch_regexp('ggggggggggggggg') == 'g'
puts crunch_regexp('a') == 'a'
puts crunch_regexp('') == ''

puts crunch_regexp('ddaaiillyy ddoouubbllee')
puts crunch_regexp('4444abcabccba')
puts crunch_regexp('ggggggggggggggg')
puts crunch_regexp('a')
puts crunch_regexp('')
