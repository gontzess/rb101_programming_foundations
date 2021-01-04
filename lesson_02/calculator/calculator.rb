# Walk through: Calculator + Refactoring + Bonus Features

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key, string=nil)
  message = messages(key, LANGUAGE)
  if string.nil?
    Kernel.puts("=> #{message}")
  else
    Kernel.puts("=> #{message} #{string}")
  end
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

def operation_to_verb(op)
  verb = 'operation_verb_' + op
  # x = "blah blah"
  verb
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt('hello', name)

loop do # main loop
  number1 = ''
  loop do
    prompt('first_number')
    number1 = Kernel.gets().chomp()

    break if valid_number?(number1)

    prompt('valid_number')
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()

    break if valid_number?(number2)

    prompt('valid_number')
  end

  prompt('operator_prompt')

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    break if %w(1 2 3 4).include?(operator)

    prompt('valid_operator')
  end

  prompt(operation_to_verb(operator))

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

  prompt('result_summary', result.to_s)

  prompt('repeat_calc')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('thank_you')
