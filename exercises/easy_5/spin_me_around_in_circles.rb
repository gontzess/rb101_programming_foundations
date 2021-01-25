# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

msg = "hello world"
spin_me(msg) # "olleh dlrow"

puts msg

# answer: the returned string will be a new object b/c the split method returns a new array object before we have a chance to mutate.
