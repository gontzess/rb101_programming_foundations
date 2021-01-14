# Write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

def xor?(a, b)
  if a
    b ? false : true
  elsif b
    true
  else
    false
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# LS Solution:
def xor1?(a, b)
  return true if a && !b
  return true if b && !a
  false
end

puts xor1?(5.even?, 4.even?) == true
puts xor1?(5.odd?, 4.odd?) == true
puts xor1?(5.odd?, 4.even?) == false
puts xor1?(5.even?, 4.odd?) == false
