# 99 bottles using expanded English number

# Conversion data
CONVERSIONS = [
  {name: 'one', number: 1},
  {name: 'two', number: 2},
  {name: 'three', number: 3},
  {name: 'four', number: 4},
  {name: 'five', number: 5},
  {name: 'six', number: 6},
  {name: 'seven', number: 7},
  {name: 'eight', number: 8},
  {name: 'nine', number: 9},
  {name: 'ten', number: 10},
  {name: 'eleven', number: 11},
  {name: 'twelve', number: 12},
  {name: 'thirteen', number: 13},
  {name: 'fourteen', number: 14},
  {name: 'fifteen', number: 15},
  {name: 'sixteen', number: 16},
  {name: 'seventeen', number: 17},
  {name: 'eighteen', number: 18},
  {name: 'nineteen', number: 19},
  {name: 'twenty', number: 20},
  {name: 'thirty', number: 30},
  {name: 'forty', number: 40},
  {name: 'fifty', number: 50},
  {name: 'sixty', number: 60},
  {name: 'seventy', number: 70},
  {name: 'eighty', number: 80},
  {name: 'ninety', number: 90},
  {name: 'hundred', number: 100},
  {name: 'thousand', number: 1000},
  {name: 'million', number: 1000000},
  {name: 'billion', number: 1000000000},
  {name: 'trillion', number: 1000000000000}
].sort_by { |pair| -pair[:number] }

# 100 and above use 'one' as a prefix to the English number, below don't
ONE_PREFIX_BOUNDARY = 100

# 1,507,537
# One million, five hundred and seven thousand, five hundred and thirty seven

# For each base unit, add a new segment of text if the unit is used
# The segment has:
# 1) a connective fragment
# 2) recursion of number-to-english
# 3) text of base unit

# Millions:   No intro, "One ",                           "million"
# Thousands:  ", ",     "five hundred and seven" + " ",   "thousand"
# Hundreds:   ", ",     "five ",                          "hundred"
# Thirties:   " and ",  No recursion,                     "thirty"
# Sevens:     " ",      No recursion,                     "seven"

# Convert from positive integer to English words
def english_number original_number
  current_number = original_number
  exploded_number = []
  # Convert number into an array of multiples of base units
  CONVERSIONS.each do |base_pair|
    if current_number >= base_pair[:number] * 2
      # Enter the multiple and the base unit as elements if necessary
      exploded_number << current_number / base_pair[:number]
      exploded_number << base_pair
      current_number %= base_pair[:number]
    elsif current_number >= base_pair[:number]
      # Enter just the base unit if there's no integer multiple
      exploded_number << base_pair
      current_number %= base_pair[:number]
    end
    # Otherwise enter nothing
  end
  # Eg array [{1000000}, 507, {1000}, 5, 100, 30, 7]
  # Reduce array to an English translation
  english_result = exploded_number.reduce(["",:start]) { |text_string, base_pair|
    # Add a space unless it's the start of the string
    text_string[0] += ' ' unless text_string[1] == :start
    # Convert current number to English if it's a multiple
    if base_pair.class == Integer
      text_string[0] += english_number(base_pair)
      text_string[1] = :multiple
    elsif base_pair[:number] >= ONE_PREFIX_BOUNDARY
      # Otherwise, if it's >= 100 and preceding unit is not a multiple add 'one'
      text_string[0] += 'one ' unless text_string[1] == :multiple
      text_string[0] += base_pair[:name]
      text_string[1] = :above_boundary
    else
      # Otherwise, if it's <100 and transitioning from >=100, add 'and'
      text_string[0] += 'and ' if text_string[1] == :above_boundary
      text_string[0] += base_pair[:name]
      text_string[1] = :below_boundary
    end
    text_string
  }[0]
  return english_result
end

# Main code
# 99 bottles of beer on the wall

number_of_bottles = 99

97.times do |bottles_dropped|
  puts "#{english_number(99 - bottles_dropped)} bottles, sitting on the wall"
  puts "#{english_number(99 - bottles_dropped)} bottles, sitting on the wall"
  puts "and if one green bottle, should accidentally fall"
  puts "there'd be #{english_number(98-bottles_dropped)} green bottles, sitting on the wall"
end

puts "two green bottles, sitting on the wall\ntwo green bottles, sitting on the wall\nand if one green bottle, should accidentally fall\nthere'd be one green bottle, sitting on the wall"
puts "one green bottle, sitting on the wall\none green bottle, sitting on the wall\nand if one green bottle, should accidentally fall\nthere'd be no green bottles, sitting on the wall"
