# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# return value is [1, 2, 3] b/c 'hi' is always truthy, hence select will take each element
