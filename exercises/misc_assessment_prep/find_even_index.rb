=begin
You are given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1. Empty arrays are equal to 0 in this problem.
=end

# solution that takes care of bad use cases too
def find_even_index_v1(ary)
  return 0 if ary.empty?

  (0..ary.length - 1).each do |n|
    if n < ary.length - 1 ## for every index except the last idx
      return n if ary[0...n].sum == ary[n + 1..-1].sum ## does not include nth element in the 2nd sum
    else ## if we make it to the final idx
      return n if ary[0...n].sum == ary[-1] ## includes nth element in the 2nd sum
    end
  end

  -1
end

# clean solution that solves original problem from video
def find_even_index(ary)
  return 0 if ary.empty?

  (0..ary.length - 1).each do |n|
    return n if ary[0...n].sum == ary[n + 1..-1].sum
  end

  -1
end



p find_even_index([]) == 0
## p find_even_index([1, 1, 2]) == 2 # WRONG USE CASE
p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
## p find_even_index([30, -80, 10, 10, 15, 35, 20]) == 6 # WRONG USE CASE
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

p find_even_index([]) #== 0
## p find_even_index([1, 1, 2]) #== 2 # WRONG USE CASE
p find_even_index([1, 2, 3, 4, 3, 2, 1]) #== 3
p find_even_index([1, 100, 50, -51, 1, 1]) #== 1
p find_even_index([1, 2, 3, 4, 5, 6]) #== -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) #== 3
## p find_even_index([30, -80, 10, 10, 15, 35, 20]) #== 6 # WRONG USE CASE
p find_even_index([10, -80, 10, 10, 15, 35, 20]) #== 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) #== 3
