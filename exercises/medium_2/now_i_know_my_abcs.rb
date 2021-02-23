# A collection of spelling blocks has two letters per block, as shown in this list.
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.
# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

BLOCKS = [['B', 'O']] + [['X', 'K']] + [['D', 'Q']] + [['C', 'P']] +
         [['N', 'A']] + [['G', 'T']] + [['R', 'E']] + [['F', 'S']] +
         [['J', 'W']] + [['H', 'U']] + [['V', 'I']] + [['L', 'Y']] +
         [['Z', 'M']]

def block_word?(word)
  word = word.upcase
  BLOCKS.each do |(char1, char2)|
    counter = word.count(char1) + word.count(char2)
    return false if counter > 1
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

# p block_word?('BATCH')
# p block_word?('BUTCH')
# p block_word?('jest')
