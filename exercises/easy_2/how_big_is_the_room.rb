# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

SQMETERS_TO_SQFEET = 10.7639

def get_length
  puts "==> Enter the length of the room in meters:"
  length = gets.chomp.to_f
end

def get_width
  puts "==> Enter the width of the room in meters:"
  width = gets.chomp.to_f
end

def calculate_area(length, width)
  length * width
end

def to_sq_ft(area_sq_m)
  (area_sq_m * SQMETERS_TO_SQFEET).round(2)
end

def display_area(area_sq_m, area_sq_ft)
  puts "==> The area of the room is #{area_sq_m} square meters (#{area_sq_ft} square feet)."
end

length_m = get_length
width_m = get_width

area_sq_m = calculate_area(length_m, width_m)
area_sq_ft = to_sq_ft(area_sq_m)

display_area(area_sq_m, area_sq_ft)
