# New school Roman numerals
# Show IV for 4 instead of IIII
# Owing to the approach taken, this is trivial

# Conversion code
def roman_numeral number, roman
  roman.sort_by!{ |numeral| -numeral[:value] }

  text_form = roman.reduce({ converted: "", remainder: number }) { |conversion, numeral|
    {converted: conversion[:converted] + numeral[:character] * (conversion[:remainder] / numeral[:value]),
      remainder: conversion[:remainder] % numeral[:value]}
    }

  text_form[:converted]
end

# Define the conversion values
roman = [
  { character: 'M', value: 1000 }, { character: 'D', value: 500 },
  { character: 'L', value: 50 }, { character: 'X', value: 10 },
  { character: 'V', value: 5 }, { character: 'IV', value: 4 },
  { character: 'I', value: 1 }, { character: 'C', value: 100 }
]

# Get the number to convert
puts 'Enter an integer between 1 and about 3,000'
entered_number = gets.to_i

# Convert and show the number
puts roman_numeral(entered_number, roman)
