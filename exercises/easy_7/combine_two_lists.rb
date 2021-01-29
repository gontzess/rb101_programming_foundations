# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

def interleave(ary1, ary2)
  new_ary = []
  n = ary1.length - 1
  for i in 0..n do
    new_ary.push(ary1[i]).push(ary2[i])
  end
  new_ary
end

def interleave_vLS(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

# FURTHER EXPLORATION: See if you can rewrite interleave to use zip.

def interleave_v2(ary1, ary2)
  ary1.zip(ary2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

p interleave_v2([1, 2, 3], ['a', 'b', 'c'])
puts interleave_v2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
