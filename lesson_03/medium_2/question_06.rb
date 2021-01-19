# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid_sg?(color)
  color == "blue" || color == "green"
end

puts color_valid("blue")
puts color_valid("yellow")

puts color_valid_sg?("blue")
puts color_valid_sg?("yellow")
