# Convert Roman number to integer

# Array of conversions
NUMERALS = {
  M: 1000, D: 500, C: 100, L: 50, X: 10, V: 5, I: 1
}

# Conversion method
def roman_to_integer roman_number
  roman_exploded = roman_number.split("")
  # Check valid input
  raise "Invalid input" unless roman_exploded.all? { |numeral| NUMERALS.has_key?(numeral.to_sym) }
  # Convert array of roman numerals to array of integer equivalents
  decimal_values = NUMERALS.values_at(*roman_exploded.map(&:to_sym)).flatten
  decimal_values.each_with_index do |value, index|
    if index + 1 < decimal_values.length
      # Small numeral before bigger => bigger *minus* smaller
      if value < decimal_values[index+1]
        decimal_values[index] *= -1
      end
    end
  end
  return decimal_values.reduce(:+)
end

# Main code
puts 'Enter a Roman number to convert'
roman = gets.chomp
puts roman_to_integer roman
