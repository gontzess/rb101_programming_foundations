=begin
You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:

12 ==> 21
513 ==> 531
2017 ==> 2071

If no bigger number can be composed using those digits, return -1:
9 ==> -1
111 ==> -1
531 ==> -1
=end

def next_bigger_num(num)
  chars = num.to_s.chars
  last_idx = chars.length
  return -1 if chars == chars.sort.reverse
  flipped = []
  (2..last_idx).each do |idx|
    flipped = chars[0...-idx] + chars[-idx..-1].sort.reverse
    break if flipped.join.to_i > num
  end
  flipped.join.to_i
end

def next_bigger_num_v2(num)
  chars = num.to_s.chars
  start_idx = chars.length - 2
  # return -1 if chars == chars.sort.reverse

  start_idx.step(to: 0, by: -1) do |idx|
    flipped_chars = chars[0...idx] + chars[idx..-1].sort.reverse
    flipped_num = flipped_chars.join.to_i
    return flipped_num if flipped_num > num
  end

  -1
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798

p next_bigger_num_v2(9) == -1
p next_bigger_num_v2(12) == 21
p next_bigger_num_v2(513) == 531
p next_bigger_num_v2(2017) == 2071
p next_bigger_num_v2(111) == -1
p next_bigger_num_v2(531) == -1
p next_bigger_num_v2(123456789) == 123456798
