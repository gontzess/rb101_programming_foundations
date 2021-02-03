# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

=begin
arr = hsh.each_with_object([]) do |(_, details), new_arr|
  if details[:type] == 'fruit'
    colors = details[:colors].map do |color|
      color.capitalize
    end
    new_arr.push(colors)
  else
    size = details[:size].upcase
    new_arr.push(size)
  end
end
=end


#refactored:
arr = hsh.each_with_object([]) do |(_, details), new_arr|
  case details[:type]
  when 'fruit'
    colors = details[:colors].map do |color|
      color.capitalize
    end
    new_arr.push(colors)
  when 'vegetable'
    size = details[:size].upcase
    new_arr.push(size)
  end
end

# could've also used map, per LS reco 

p arr
p hsh
