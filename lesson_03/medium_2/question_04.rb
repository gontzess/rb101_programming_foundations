# To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# here when a_string_param is modified, it is appending the oroginal object that it references, so the change is seen outside the method as well. the array however is a reassignment within the method, so when an_array_param is reassigned to the new array, it creates a new object for the array and re-points it. it does not change the my_array object.

# LS wording:
# With the Array#= assignment, our literal ['pumpkins', 'rutabaga'] array is a new object, and we are assigning it to the local variable an_array_param.
