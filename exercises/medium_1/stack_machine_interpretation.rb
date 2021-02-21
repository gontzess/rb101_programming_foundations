# Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

# n - Place a value n in the "register". Do not modify the stack.
# PUSH - Push the register value on to the stack. Leave the value in the register.
# ADD - Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB - Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT - Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV - Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD - Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP - Remove the topmost item from the stack and place in register
# PRINT - Print the register value

# always shifting from the commands (left to right), until none left.
# for each command, we decide which command to call, then call the relevant method.

def minilang(command_string)
  register = 0
  stack = []
  commands = command_string.split

  loop do
    break if commands.empty?

    command = commands.shift
    case command
    when "PUSH"
      stack.push(register)
    when "ADD"
      register += stack.pop
    when "SUB"
      register -= stack.pop
    when "MULT"
      register *= stack.pop
    when "DIV"
      register /= stack.pop
    when "MOD"
      register %= stack.pop
    when "POP"
      register = stack.pop
    when "PRINT"
      puts register
    else
      register = command.to_i
    end
  end
end

def minilang_v2(command_string)
  register = 0
  stack = []
  commands = command_string.split

  commands.each do |command|
    case command
    when "PUSH"
      stack.push(register)
    when "ADD"
      register += stack.pop
    when "SUB"
      register -= stack.pop
    when "MULT"
      register *= stack.pop
    when "DIV"
      register /= stack.pop
    when "MOD"
      register %= stack.pop
    when "POP"
      register = stack.pop
    when "PRINT"
      puts register
    else
      register = command.to_i
    end
  end
  register.to_s
end

# FURTHER EXPLORATION: Try writing a minilang program to evaluate and print the result of the following expression: (3 + (4 * 5) - 7) / (5 % 3). The answer should be 8. This is trickier than it sounds! Note that we aren't asking you to modify the #minilang method; we want you to write a Minilang program that can be passed to #minilang and evaluated.

def rotate_array(ary)
  ary[1..-1] + [ary[0]]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_rightmost_chars(str, n)
  ary = str.chars
  ary[-n..-1] = rotate_string(ary[-n..-1])
  ary.join
end

# thoughts
# once we substitute the operation symbols for their equivalent keys, we then need to account for the nested expressions. do we need to add PUSH in before an ADD and a SUB, etc?
# each time you hit a parenthesis, you start a new evaluation and you need to flip the string of commands because were actually storing the first number in and then operating on the second number, which is the opposite from mathematical expression that reads left to right.
# need to find a way to isolate expressions, b/c we're only flipping the expression arguments, not the full remainder of the commands, i think?

def format_expression(string)
  string = string
  string = string.gsub(, )
  string = string.gsub('+', "PUSH ADD")
  string = string.gsub('-', "SUB")
  string = string.gsub('*', "MULT")
  string = string.gsub('/', "DIV")
  string = string.gsub('%', "MOD")
  string = string.gsub(')', " POP")
  string
end

expression = "(3 + (4 * 5) - 7) / (5 % 3)"

puts minilang_v2(format_expression(expression))


# minilang('PRINT')
# minilang_v2('PRINT')
# # 0
# p '-'
#
# minilang('5 PUSH 3 MULT PRINT')
# minilang_v2('5 PUSH 3 MULT PRINT')
# # 15
# p '-'
#
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang_v2('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8
# p '-'
#
# minilang('5 PUSH POP PRINT')
# minilang_v2('5 PUSH POP PRINT')
# # 5
# p '-'
#
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang_v2('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7
# p '-'
#
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# minilang_v2('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6
# p '-'
#
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# minilang_v2('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12
# p '-'
#
# minilang('-3 PUSH 5 SUB PRINT')
# minilang_v2('-3 PUSH 5 SUB PRINT')
# # 8
# p '-'
#
# minilang('6 PUSH')
# minilang_v2('6 PUSH')
# # (nothing printed; no PRINT commands)
# p '-'
