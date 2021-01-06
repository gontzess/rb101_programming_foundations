# Mortgage Loan Calculator

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def clear_screen
  (system 'clear') || (system 'cls')
end

def messages(message)
  MESSAGES[message]
end

def display(key, string=nil)
  message = messages(key)
  string.nil? ? (puts "=> #{message}") : (puts "=> #{message} #{string}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_loan_amount?(input)
  (float?(input) || integer?(input)) && input.to_f > 0.0
end

def valid_annual_percentage_rate?(input)
  (float?(input) || integer?(input)) && input.to_f >= 0.0
end

def valid_loan_years?(input)
  (float?(input) || integer?(input)) && input.to_f > 0.0
end

def get_loan_amount
  loan_amount = ''
  loop do
    display('request_loan_amount')
    loan_amount = gets.chomp.delete "$,"

    break if valid_loan_amount?(loan_amount)

    display('invalid_loan_amount')
  end
  loan_amount.to_f
end

def get_annual_percentage_rate
  annual_percentage_rate = ''
  loop do
    display('request_annual_percentage_rate')
    annual_percentage_rate = gets.chomp.delete "%,"

    break if valid_annual_percentage_rate?(annual_percentage_rate)

    display('invalid_annual_percentage_rate')
  end
  annual_percentage_rate.to_f
end

def get_loan_years
  loan_years = ''
  loop do
    display('request_loan_years')
    loan_years = gets.chomp

    break if valid_loan_years?(loan_years)

    display('invalid_loan_years')
  end
  loan_years.to_f
end

def calculate_monthly_payment(loan_amount,
                              monthly_interest_rate_decimal,
                              loan_months)
  loan_amount * (monthly_interest_rate_decimal / (1 - (1 +
                monthly_interest_rate_decimal)**(-loan_months)))
end

def format_to_dollars(num)
  num.round(2).to_s.prepend("$")
end

def another_calculation?
  answer = ''
  loop do
    display('repeat_calc')
    answer = gets.chomp.downcase

    break if %w(y n).include?(answer)

    display('invalid_repeat_calc')
  end
  answer == 'y'
end

##

clear_screen

display('welcome')

loop do # main loop
  loan_amount = get_loan_amount
  monthly_interest_rate_decimal = (get_annual_percentage_rate / 100) / 12
  loan_months = get_loan_years * 12
  display('calculating')

  monthly_payment = calculate_monthly_payment(loan_amount,
                                              monthly_interest_rate_decimal,
                                              loan_months)
  monthly_payment_dollars = format_to_dollars(monthly_payment)
  display('result_summary', monthly_payment_dollars)

  break unless another_calculation?
end

display('thank_you')
