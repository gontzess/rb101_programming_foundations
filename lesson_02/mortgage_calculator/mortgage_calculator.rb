# Mortgage Loan Calculator

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def messages(message)
  MESSAGES[message]
end

def prompt(key, string=nil)
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

prompt 'welcome'

loop do # main loop
  loan_amount = ''
  loop do
    prompt('request_loan_amount')
    loan_amount = gets.chomp.delete "$,"

    break if valid_loan_amount?(loan_amount)

    prompt('invalid_loan_amount')
  end

  annual_percentage_rate = ''
  loop do
    prompt('request_annual_percentage_rate')
    annual_percentage_rate = gets.chomp.delete "%,"

    break if valid_annual_percentage_rate?(annual_percentage_rate)

    prompt('invalid_annual_percentage_rate')
  end

  loan_years = ''
  loop do
    prompt('request_loan_years')
    loan_years = gets.chomp

    break if valid_loan_years?(loan_years)

    prompt('invalid_loan_years')
  end

  prompt('calculating')

  loan_amount = loan_amount.to_f
  annual_percentage_rate = annual_percentage_rate.to_f
  loan_years = loan_years.to_f
  loan_months = loan_years * 12
  monthly_interest_rate_decimal = (annual_percentage_rate / 100) / 12

  monthly_payment = loan_amount *
                    (monthly_interest_rate_decimal /
                    (1 - (1 + monthly_interest_rate_decimal)**(-loan_months)))

  # "$#{format('%.2f', monthly_payment)}" # alt way to format money from LS
  monthly_payment = monthly_payment.round(2).to_s.prepend("$")

  prompt('loan_summary', monthly_payment)

  prompt('repeat_calc')
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end
