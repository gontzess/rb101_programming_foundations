=begin
17:30
18:48
Given an array of strings made only from lowercase letters, return an array of all characters that show up in all strings within the given array (including duplicates). For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.
=end

def common_chars_v1(ary)
  tallies_ary = ary.map do |word|
    char_tally = Hash.new(0)
    word.chars do |char|
      char_tally[char] += 1
    end
    char_tally
  end

  first_tally = tallies_ary.shift
  reduced_tally = first_tally.select do |(key_1, _)|
    tallies_ary.all? do |hash|
      hash.has_key?(key_1)
    end
  end

  reduced_letters = []
  reduced_tally.each do |letter, count|
    lowest = tallies_ary.inject(count) do |memo, hash|
      hash[letter] < memo ? hash[letter] : memo
    end
    reduced_letters << (letter * lowest).chars
  end
  reduced_letters.flatten
end


def common_chars_v2(ary)
  tallies_ary = ary.map do |word|
    word.chars.tally
  end

  reduced_letters = []
  tallies_ary.first.each do |letter, count|
    in_all = tallies_ary.all? do |hash|
      hash.has_key?(letter)
    end
    if in_all
      lowest = tallies_ary.inject(count) do |memo, hash|
        hash[letter] < memo ? hash[letter] : memo
      end
      reduced_letters << (letter * lowest).chars
    end
  end

  reduced_letters.flatten
end


def common_chars_v3(ary)
  ary = ary.map { |word| word.dup }

  chars = ary.shift.chars

  chars.select do |char|
    ary.all? do |word|
      word.sub!(char, "")
    end
  end
end


# p common_chars_v1(['bella', 'label', 'roller']) == ['e', 'l', 'l']
# p common_chars_v1(['cool', 'lock', 'cook']) == ['c', 'o']
# p common_chars_v1(['aabbaa', 'cccdddd', 'eeffee', 'ggrrrr']) == []


# p common_chars_v2(['bella', 'label', 'roller']) == ['e', 'l', 'l']
# p common_chars_v2(['cool', 'lock', 'cook']) == ['c', 'o']
# p common_chars_v2(['aabbaa', 'cccdddd', 'eeffee', 'ggrrrr']) == []

p common_chars_v3(['bella', 'label', 'roller']) #== ['e', 'l', 'l']
p common_chars_v3(['cool', 'lock', 'cook']) #== ['c', 'o']
# p common_chars_v3(['aabbaa', 'cccdddd', 'eeffee', 'ggrrrr']) == []
