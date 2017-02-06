# Shuffle method to put items in an array into random order

# Assumption: method should use recursion to fit with chapter

# Example array
array = [
  "apple", "banana", "pineapple", "strawberry", "papaya", "melon",
  "star fruit", "kiwi fruit", "pear"
]

# Shuffle method
def shuffle to_be_shuffled
  left_array = []
  right_array = []
  # Place each item into left or right hand list at random
  to_be_shuffled.each do |item|
    if rand(2) == 1
      left_array << item
    else
      right_array << item
    end
  end

  # Shuffle the left and right lists if they're bigger than 1 item
  left_array = shuffle(left_array) if left_array.length >1
  right_array = shuffle(right_array) if right_array.length >1

  return [left_array, right_array].flatten
end

# Main code
puts 'Unsorted array:'
puts array
puts 'Shuffled array:'
puts shuffle(array)
