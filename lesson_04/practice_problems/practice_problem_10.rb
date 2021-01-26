# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# returns a new array [1, nil, nil]. puts returns nil for the last two iterations through the block.
