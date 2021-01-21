# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input. You may not use ruby's Date and Time classes.

def time_of_day(minutes)
  hrs, mins = minutes.divmod(60)
  hrs %= 24
  "#{format('%02d', hrs)}:#{format('%02d', mins)}"
end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day_LS(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

# FURTHER EXPLORATION: How would you approach this problem if you were allowed to use ruby's Date and Time classes? Suppose you also needed to consider the day of week? (Assume that delta_minutes is the number of minutes before or after midnight between Saturday and Sunday; in such a method, a delta_minutes value of -4231 would need to produce a return value of Thursday 01:29.)

WEEK_START_DATE = Time.at(259200).gmtime
SECONDS_PER_MINUTE = 60

def time_of_day_v2(minutes)
  secs = minutes * SECONDS_PER_MINUTE
  date = WEEK_START_DATE + secs
  date.strftime('%A %H:%M')
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

puts time_of_day(0)
puts time_of_day(-3)
puts time_of_day(35)
puts time_of_day(-1437)
puts time_of_day(3000)
puts time_of_day(800)
puts time_of_day(-4231)

puts time_of_day_v2(0)
puts time_of_day_v2(-3)
puts time_of_day_v2(35)
puts time_of_day_v2(-1437)
puts time_of_day_v2(3000)
puts time_of_day_v2(800)
puts time_of_day_v2(-4231)
