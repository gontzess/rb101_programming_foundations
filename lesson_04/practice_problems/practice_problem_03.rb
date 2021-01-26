# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# returns [1, 2, 3] since the block ends with puts, which always returns nil. reject returns all elements for which the block is falsey 
