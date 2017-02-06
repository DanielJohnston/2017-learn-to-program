# Dictionary sort method using recursion
# Let's make it a quicksort for fun!

# Sample array
source_data = [
  "apple", "Apple", "apple", "pineapple", "pineApple", "strawberry",
  "star fruit", "Kiwi Fruit", "pear", "Strawberry", "papaya", "melon",
  "Apple"
]

# Followed a different path to the book structure
def dictionary_sort array
  raise "Called sort with too few elements" if array.length < 2

  midpoint = array.delete_at(array.length/2)
  left_array = []
  right_array = []

  array.each do |item|
    if item.to_s.downcase <= midpoint.to_s.downcase
      left_array << item
    else
      right_array << item
    end
  end

  left_array = dictionary_sort(left_array) if left_array.length >= 2
  right_array = dictionary_sort(right_array) if right_array.length >=2

  return [left_array, midpoint, right_array].flatten
end

# Main code
puts 'Unsorted array:'
puts source_data

puts 'Sorted array:'
puts dictionary_sort source_data
