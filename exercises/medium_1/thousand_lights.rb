# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

=begin
pseudocode:
-- each light (ie n) reaches it "final switch placement" on the nth round
-- light(n) will be switched x times such that x is the tally of factors that go into n.
-- build an ary that only takes odd # of switches
=end

def count_switch_toggles(int) # aka counting tally of factors of int
  counter = 0
  (1..int).each do |n|
    if int % n == 0
      counter += 1
    end
  end
  counter
end

def lights_on(n)
  1.upto(n).select do |light_num|
    count_switch_toggles(light_num).odd?
  end
end

p count_switch_toggles(1) == 1
p count_switch_toggles(2) == 2
p count_switch_toggles(3) == 2
p count_switch_toggles(4) == 3
p count_switch_toggles(5) == 2
p count_switch_toggles(6) == 4

p lights_on(5) == [1, 4]
p lights_on(6) == [1, 4]
p lights_on(10) == [1, 4, 9]
p lights_on(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
