# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(string)
  counter = 0
  string.each_char do |char|
    counter += 1 if char == '('
    counter -= 1 if char == ')'
    # return false if counter < 0
    break if counter < 0
  end
  counter == 0
end

# FURTHER EXPLORATION: There are a few other characters that should be matching as well. Square brackets and curly brackets normally come in pairs. Quotation marks(single and double) also typically come in pairs and should be balanced. Can you expand this method to take into account those characters?

MATCHING_CHARS = [ %w(( )), %w([ ]), %w({ }), %w(' '), %w(" "), %w(¿ ?) ]

def balanced_v2?(string)
  counters = (0...MATCHING_CHARS.length).each_with_object({}) do |idx, hash|
               hash[idx] = 0
             end

  string.each_char do |char|
    MATCHING_CHARS.each_with_index do |pair, idx|
      counters[idx] += 1 if char == pair[0]
      if pair[0] != pair[1]
        counters[idx] -= 1 if char == pair[1]
      else
        counters[idx] %= 2
      end

      return false if counters[idx] < 0
    end
  end

  counters.values.all?(0)
end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

# p '**'
# p balanced?('What (is) this?')
# p balanced?('What is) this?')
# p balanced?('What (is this?')
# p balanced?('((What) (is this))?')
# p balanced?('((What)) (is this))?')
# p balanced?('Hey!')
# p balanced?(')Hey!(')
# p balanced?('What ((is))) up(')


p balanced_v2?("()[]''""{} ") == true
p balanced_v2?("()[](''""{} ") == false
p balanced_v2?("()']['""{} ") == false
p balanced_v2?("()[]''""{}{ ") == false
p balanced_v2?("()']['""{} ") == false
p balanced_v2?(" is") == true
p balanced_v2?('¿[is]?') == true
p balanced_v2?('¿"is"?') == true
p balanced_v2?("¿'is'?") == true
p balanced_v2?("¿'is'?'") == false
p balanced_v2?("¿{is}?") == true
p balanced_v2?("¿{i}?") == true
p balanced_v2?("¿is}?") == false
p balanced_v2?("¿{is?") == false
p balanced_v2?("¿'is?") == false
p balanced_v2?("¿is'?") == false
p balanced_v2?("¿'s'?") == true
p balanced_v2?('¿"is?') == false
p balanced_v2?('¿is"?') == false
p balanced_v2?('¿"s"?') == true
p balanced_v2?("¿[i]?") == true
p balanced_v2?("¿is]?") == false
p balanced_v2?("¿[is?") == false

# p balanced_v2?("()[]''""{} ")
# p balanced_v2?("()']['""{} ")
# p balanced_v2?("()[]''""{}{ ")
# p balanced_v2?("()']['""{} ")
# p balanced_v2?(" is")
# p balanced_v2?('¿[is]?')
# p balanced_v2?('¿"is"?')
# p balanced_v2?("¿'is'?")
# p balanced_v2?("¿'is'?'")
# p balanced_v2?("¿{is}?")
# p balanced_v2?("¿{i}?")
# p balanced_v2?("¿is}?")
# p balanced_v2?("¿{is?")
# p balanced_v2?("¿'is?")
# p balanced_v2?("¿is'?")
# p balanced_v2?("¿'s'?")
# p balanced_v2?('¿"is?')
# p balanced_v2?('¿is"?')
# p balanced_v2?('¿"s"?')
# p balanced_v2?("¿[i]?")
# p balanced_v2?("¿is]?")
# p balanced_v2?("¿[is?")
