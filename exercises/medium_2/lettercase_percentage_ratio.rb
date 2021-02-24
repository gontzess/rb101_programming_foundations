# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_percentages(string)
  lower = 0
  upper = 0
  neither = 0
  total = string.size.to_f
  string.each_char do |chr|
    case chr
    when /[a-z]/ then lower += 1
    when /[A-Z]/ then upper += 1
    else              neither += 1
    end
  end
  { lowercase: (lower / total) * 100, uppercase: (upper / total) * 100, neither: (neither / total) * 100 }
end

def letter_percentages_v2(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = {}
  total = string.size.to_f

  string.each_char do |chr|
    case chr
    when /[a-z]/ then counts[:lowercase] += 1
    when /[A-Z]/ then counts[:uppercase] += 1
    else              counts[:neither] += 1
    end
  end

  counts.each do |key, counter|
    percent = (counter / total) * 100
    percentages[key] = percent.round(2)
  end

  percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')

p letter_percentages_v2('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages_v2('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages_v2('123') == { lowercase: 0, uppercase: 0, neither: 100 }

p letter_percentages_v2('abCdef 123')
p letter_percentages_v2('AbCd +Ef')
p letter_percentages_v2('123')
p letter_percentages_v2('abcdefGHI')
