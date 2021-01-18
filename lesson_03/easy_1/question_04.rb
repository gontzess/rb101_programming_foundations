# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1)
# deletes the element within numbers at index = 1, and returns that removed element. method is destructive
numbers.delete(1)
# deletes the element in numbers such that the value = 1, aka element at index 0, and returns that removed element. method is destructive
