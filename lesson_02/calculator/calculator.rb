# Walk through: Calculator + Refactoring + Bonus Features

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def display(key, string=nil)
  message = messages(key, LANGUAGE)
  if string.nil?
    Kernel.puts("=> #{message}")
  else
    Kernel.puts("=> #{message} #{string}")
  end
end

def clear_screen
  (system 'clear') || (system 'cls')
end

def integer?(num)
  num.to_i().to_s() == num
end

def float?(num)
  num.to_f().to_s() == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def divide_by_zero?(number2, operator)
  (number2.to_f() == 0.0) && (operator == '4')
end

def operation_to_verb(op)
  verb = 'operation_verb_' + op
  # x = "blah blah"
  verb
end

def display_calculating(operator)
  operating_verb = operation_to_verb(operator)
  display(operating_verb)
end

def get_name
  name = ''
  loop do
    name = Kernel.gets().chomp().strip()

    name.empty?() ? display('invalid_name') : break
  end
  name
end

def get_first_num
  number1 = ''
  loop do
    display('first_number')
    number1 = Kernel.gets().chomp()

    break if valid_number?(number1)

    display('invalid_number')
  end
  number1
end

def get_second_num
  number2 = ''
  loop do
    display('second_number')
    number2 = Kernel.gets().chomp()

    break if valid_number?(number2)

    display('invalid_number')
  end
  number2
end

def get_operator(number2)
  display('operator_options')

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    break if %w(1 2 3 4).include?(operator) &&
      !divide_by_zero?(number2, operator)

    divide_by_zero?(number2, operator) ?
      display('invalid_operator_divide_by_zero') :
      display('invalid_operator')
  end
  operator
end

def perform_calculation(number1, number2, operator)
  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end
end

def another_calculation?
  answer = ''
  loop do
    display('repeat_calc')
    answer = Kernel.gets().chomp().downcase()

    break if %w(y n).include?(answer)

    display('invalid_repeat_calc')
  end
  answer == 'y'
end


# main calculator

clear_screen

display('welcome')

name = get_name
display('hello', name)

loop do
  number1 = get_first_num
  number2 = get_second_num
  operator = get_operator(number2)
  display_calculating(operator)

  result = perform_calculation(number1, number2, operator).to_s
  display('result_summary', result)

  break unless another_calculation?
end

display('thank_you')
