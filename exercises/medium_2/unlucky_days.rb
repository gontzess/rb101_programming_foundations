# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

require 'time'
require 'date'

def friday_13th(year)
  friday_count = 0
  (1..12).each do |month|
    t = Time.new(year, month, 13)
    friday_count += 1 if t.friday?
  end
  friday_count
end

def friday_13th_vLS(year)
  unlucky_count = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

# FURTHER EXPLORATION: An interesting variation on this problem is to count the number months that have five Fridays. This one is harder than it sounds since you must account for leap years.

MONTH_LENGTHS = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
MONTH_LENGTHS_LEAP = [nil, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

def five_friday_months(year)
  month_lengths = Date.leap?(year) ? MONTH_LENGTHS_LEAP : MONTH_LENGTHS
  month_count = 0
  (1..12).each do |month|
    friday_count = 0
    (1..month_lengths[month]).each do |day|
      d = Date.new(year, month, day)
      friday_count += 1 if d.friday?
    end
    month_count += 1 if friday_count >= 5
  end
  month_count
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

# p Date.gregorian_leap?(1900)
# p Date.leap?(1900)
# p Date.gregorian_leap?(2000)
# p Date.leap?(2000)

p five_friday_months(2021) == 5
p five_friday_months(2022) == 4
p five_friday_months(2026) == 4
p five_friday_months(2027) == 5
