# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a


# a is still 2 but arr[0] is 4
# arr[1][0] is 3
# b is [3, 8]
# arr is [4, [3, 8]]

p a
p b
p arr