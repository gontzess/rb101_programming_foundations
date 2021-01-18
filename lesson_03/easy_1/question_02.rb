=begin
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

what is != and where should you use it?
# this is the "does not equal" and is used for comparisons & logical expressions.

put ! before something, like !user_name
# it negates whats before it. so if username is a a string, it means any string other than user_name.

put ! after something, like words.uniq!
# in the case that its before a method, it sometimes means that the method is destructive, so it will alter the original object.

put ? before something
# could be ternary operator

put ? after something
# if placed after an expression, can be used for a ternary expression.

put !! before something, like !!user_name
# double negative, so is equivalent to user_name. WRONG
## LS: !!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)

=end
