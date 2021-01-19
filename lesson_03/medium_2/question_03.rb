# Let's call a method, and pass both a string and an array as arguments and see how even though they are treated in the same way by Ruby, the results can be different.

#Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# results:
# string is "pumpkins"
# array is ["pumpkins", "rutabaga"]

# both method arguements are passed by value of the referenced objects.the string += operation creates a new string object, and then reassigns this new object to a_string_param. the array << operation does not reassign, it appends the new element to the array object which is also still referenced by my_array outside the method.
