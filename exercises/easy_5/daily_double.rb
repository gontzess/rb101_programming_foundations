# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

def crunch(phrase)
  #phrase.gsub(/.{2,}?/) { |dupes| dupes[0] }
  phrase.gsub(/..+?/) { |dupes| dupes[0] }
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
