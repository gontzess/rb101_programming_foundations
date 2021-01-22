# Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

INTEGERS = (0..19).to_a

ENGLISH_WORDS = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]

NUMBERS = INTEGERS.zip(ENGLISH_WORDS).to_h

def alphabetic_number_sort(ary_int)
  ary_words_sorted = ary_int.map { |int| NUMBERS[int] }.sort
  ary_int_sorted = ary_words_sorted.map { |word| NUMBERS.key(word) }
end

def alphabetic_number_sort_vLS(ary_int)
  ary_int.sort_by { |int| ENGLISH_WORDS[int] }
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

p alphabetic_number_sort((0..19).to_a)

puts alphabetic_number_sort_vLS((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

p alphabetic_number_sort_vLS((0..19).to_a)
