# Shuffle method to put items in an array into random order
# Revised to be an array method

# Assumption: method should use recursion to fit with chapter

# Example array
array = [
  "apple", "banana", "pineapple", "strawberry", "papaya", "melon",
  "star fruit", "kiwi fruit", "pear"
]

class Array
# Shuffle method
  def shuffle
    left_array = []
    right_array = []
    # Place each item into left or right hand list at random
    self.each do |item|
      if rand(2) == 1
        left_array << item
      else
        right_array << item
      end
    end

    # Shuffle the left and right lists if they're bigger than 1 item
    left_array = left_array.shuffle if left_array.length >1
    right_array = right_array.shuffle if right_array.length >1

    return [left_array, right_array].flatten
  end
end

# Main code
puts 'Unsorted array:'
puts array
puts 'Shuffled array:'
puts array.shuffle
