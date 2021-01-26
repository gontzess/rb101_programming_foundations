# What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# any? will put 1, 2, and 3 to the screen. but the method will return a boolean, in this case true. that's becasue num.odd? is not false or nil for at least one element/iteration.

# CORRECTION: it will only put 1 since it stops iterating after it finds the first element to evaluate to true.
