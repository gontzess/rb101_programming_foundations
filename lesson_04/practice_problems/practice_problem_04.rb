# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# returns { 'a'=>'ant', 'b'=> 'bear', 'c'=>'cat' } because the method returns the object we pass it as an arguement, in this case a hash that we then mutate.
