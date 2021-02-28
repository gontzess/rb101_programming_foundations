
# Write a function that takes two strings, A and B, and returns the length of the longest possible substring that can be formed from the concatenation of either A + B or B + A containing only characters that do not appear in both A and B.

# Example:
# Given the strings "piquancy" and "refocusing":
# A = "piquancy"
# B = "refocusing"
# A + B = "piquancyrefocusing"
# B + A = "refocusingpiquancy"

# Since 'i', 'n', 'u', and 'c' appear in both A and B, all acceptable substrings without those characters are:
# "p", "q", "a", "yrefo", "s", "g" (from A + B)
# "refo", "s", "gp", "q", "a", "y" (from B + A)

# Therefore, it would be correct to return 5: the length of "yrefo".


def find_all_substrings(str)
  n = str.length - 1
  substrings = []
  (0..n).each do |start_idx|
    (start_idx..n).each do |end_idx|
      substrings << str[start_idx..end_idx]
    end
  end

  substrings.uniq
end

def find_longest(str_a, str_b)
  str1 = str_a + str_b
  str2 = str_b + str_a
  all_substrings = (find_all_substrings(str1) + find_all_substrings(str2)).uniq

  mutual_chars = []
  str_a.each_char do |char1|
    mutual_chars << char1 if str_b.include?(char1)
  end


  all_substrings.select! do |substr|
    no_keep = substr.chars.any? do |char1|
      mutual_chars.include?(char1)
    end
    !no_keep
  end

  longest = all_substrings.max_by do |substr|
    substr.length
  end
  longest.length
end

p find_longest("piquancy", "refocusing") == 5 # => "yrefo"
p find_longest("railroad","is") == 5
p find_longest("catfish","surgery") == 11
p find_longest("seven","two") == 8
p find_longest("***aaa","") == 6

# p find_all_substrings("piquancy" + "refocusing")
