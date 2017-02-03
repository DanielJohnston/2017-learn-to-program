# Building and sorting an array

# Collect elements
array = []
element = "initial"
until element == ""
  element = gets.chomp
  array << element
end
array.pop

# sort and display
array.sort_by(&:downcase).each do |ordered_element|
  puts ordered_element
end
