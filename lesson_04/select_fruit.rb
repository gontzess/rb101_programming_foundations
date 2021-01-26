# Let's now take a look at an example with hashes. In this example we want to select the key-value pairs where the value is 'Fruit'. How would you implement a method like this?

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  selected_fruit = Hash.new
  keys = hash.keys
  counter = 0

  loop do
    break if counter == keys.length

    key = keys[counter]
    value = hash[key]

    if value == 'Fruit'
      selected_fruit[key] = value
    end

    counter += 1
  end
  
  selected_fruit
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
