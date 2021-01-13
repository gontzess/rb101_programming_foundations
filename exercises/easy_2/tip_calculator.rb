# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

def get_bill_amount
  print "What is the bill? "
  bill_amount = gets.chomp.to_f
end

def get_tip_percent
  print "What is the tip percentage? "
  tip_percent = gets.chomp.to_f
end

def calculate_tip(bill_amount, tip_percent)
  bill_amount * (tip_percent / 100)
end

def calculate_total(bill_amount, tip_amount)
  bill_amount + tip_amount
end

def display_results(tip_amount, total_amount)
  puts "The tip is $#{format('%.2f', tip_amount)}"
  puts "The total is $#{format('%.2f', total_amount)}"
end

bill_amount = get_bill_amount
tip_percent = get_tip_percent
tip_amount = calculate_tip(bill_amount, tip_percent)
total_amount = calculate_total(bill_amount, tip_amount)
display_results(tip_amount, total_amount)
