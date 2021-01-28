# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

DEGREE = "\xC2\xB0"
MAX_DEGREES = 360
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60

def dms(number)
  number %= MAX_DEGREES
  degrees, remainder = number.divmod(1)
  remainder_in_seconds = remainder * MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
  minutes, seconds = remainder_in_seconds.divmod(SECONDS_PER_MINUTE)
  #format("%d#{DEGREE}%02d\'%02d\"", degrees, minutes, seconds)
  format(%(%d#{DEGREE}%02d'%02d"), degrees, minutes, seconds)
end

def dms_v2(number)
  number %= MAX_DEGREES
  total_seconds = number * MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
  remainder_in_minutes, seconds = total_seconds.divmod(SECONDS_PER_MINUTE)
  degrees, minutes = remainder_in_minutes.divmod(MINUTES_PER_DEGREE)
  format(%(%d#{DEGREE}%02d'%02d"), degrees, minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

puts dms(30)
puts dms(76.73)
puts dms(254.6)
puts dms(93.034773)
puts dms(0)
puts dms(360)
puts dms(400)
puts dms(-40)
puts dms(-420)

puts dms_v2(30) == %(30°00'00")
puts dms_v2(76.73) == %(76°43'48")
puts dms_v2(254.6) == %(254°36'00")
puts dms_v2(93.034773) == %(93°02'05")
puts dms_v2(0) == %(0°00'00")
puts dms_v2(360) == %(360°00'00") || dms(360) == %(0°00'00")

puts dms_v2(30)
puts dms_v2(76.73)
puts dms_v2(254.6)
puts dms_v2(93.034773)
puts dms_v2(0)
puts dms_v2(360)
puts dms_v2(400)
puts dms_v2(-40)
puts dms_v2(-420)
