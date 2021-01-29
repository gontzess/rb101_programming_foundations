# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

def staggered_case(str)
  counter = 0
  characters = str.chars.map do |char|
    next char if char =~ /[^A-Za-z]/
    if counter.even?
      counter += 1
      char.upcase
    else
      counter += 1
      char.downcase
    end
  end
  characters.join
end

# FURTHER EXPLORATION: Modify this method so the caller can determine whether non-alphabetic characters should be counted when determining the upper/lowercase state. That is, you want a method that can perform the same actions that this method does, or operates like the previous version.

def staggered_case_v2(str, count_non_alpha=false)
  counter = 0
  characters = str.chars.map do |char|
    if char =~ /[^A-Za-z]/
      counter += 1 if count_non_alpha
      next char
    end
    if counter.even?
      counter += 1
      char.upcase
    else
      counter += 1
      char.downcase
    end
  end
  characters.join
end

def staggered_case_v3(str, count_non_alpha=false)
  counter = 0
  new_str = ''
  str.each_char do |char|
    if char =~ /[A-Za-z]/
      counter.even? ? new_str << char.upcase : new_str << char.downcase
      counter += 1
    else
      new_str << char
      counter += 1 if count_non_alpha
    end
  end
  new_str
end


puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

puts staggered_case_v2('I Love Launch School!')
puts staggered_case_v2('ALL CAPS')
puts staggered_case_v2('ignore 77 the 444 numbers')

puts staggered_case_v2('I Love Launch School!', true)
puts staggered_case_v2('ALL CAPS', true)
puts staggered_case_v2('ignore 77 the 444 numbers', true)

puts staggered_case_v2('I Love Launch School!', false)
puts staggered_case_v2('ALL CAPS', false)
puts staggered_case_v2('ignore 77 the 444 numbers', false)

puts staggered_case_v3('I Love Launch School!')
puts staggered_case_v3('ALL CAPS')
puts staggered_case_v3('ignore 77 the 444 numbers')

puts staggered_case_v3('I Love Launch School!', true)
puts staggered_case_v3('ALL CAPS', true)
puts staggered_case_v3('ignore 77 the 444 numbers', true)

puts staggered_case_v3('I Love Launch School!', false)
puts staggered_case_v3('ALL CAPS', false)
puts staggered_case_v3('ignore 77 the 444 numbers', false)
