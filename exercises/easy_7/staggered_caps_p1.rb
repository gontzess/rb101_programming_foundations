# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

def staggered_case(str)
  characters = str.chars.map.with_index do |char, idx|
    next char if char =~ /[^A-Za-z]/
    idx.even? ? char.upcase : char.downcase
  end
  characters.join
end

def staggered_case_vLS(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

# Further EXPLORATION: Can you modify this method so the caller can request that the first character be downcased rather than upcased? If the first character is downcased, then the second character should be upcased, and so on.

def staggered_case_v2(str, start_case='upper')
  offset = start_case == 'upper' ? 0 : 1
  characters = str.chars.map.with_index do |char, idx|
    next char if char =~ /[^A-Za-z]/
    (idx + offset).even? ? char.upcase : char.downcase
  end
  characters.join
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts staggered_case_v2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case_v2('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case_v2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts staggered_case_v2('I Love Launch School!', 'upper')
puts staggered_case_v2('ALL_CAPS', 'upper')
puts staggered_case_v2('ignore 77 the 444 numbers', 'upper')

puts staggered_case_v2('I Love Launch School!', 'lower')
puts staggered_case_v2('ALL_CAPS', 'lower')
puts staggered_case_v2('ignore 77 the 444 numbers', 'lower')
