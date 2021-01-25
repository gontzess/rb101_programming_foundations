# Write a method that will take a short line of text, and print it within a box.

# FURTHER EXPLORATION: Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.

def print_in_box(string)
  max_middle_spaces = string.length <= 76 ? string.length : 76
  puts "+-#{'-' * (max_middle_spaces)}-+"
  puts "| #{' ' * (max_middle_spaces)} |"

  while string.length > 76 do
    string_start = string.slice!(/.{,75}\s/)
    puts "| #{string_start + (' ' * (max_middle_spaces - string_start.length))} |"
  end

  puts "| #{string + (' ' * (max_middle_spaces - string.length))} |"

  puts "| #{' ' * (max_middle_spaces)} |"
  puts "+-#{'-' * (max_middle_spaces)}-+"
end


print_in_box('To boldly go where no one has gone before.')
print_in_box('')

print_in_box('To boldly go where no one has gone before is really really cool. Especially if it is outer space galaxies away from Earth. Especially if it is outer space galaxies away from Earth. Especially if it is outer space galaxies away from Earth.')
