# Old school Roman numerals

# In the early days of Roman numerals, the
# Romans didn’t bother with any of this new-fangled subtraction “IX”
# nonsense. No sir, it was straight addition, biggest to littlest—so 9 was
# written “VIIII,” and so on. Write a method that when passed an integer
# between 1 and 3000 (or so) returns a string containing the proper oldschool
# Roman numeral. In other words, old_roman_numeral 4 should return
# 'IIII'. Make sure to test your method on a bunch of different numbers.
# I = 1 V = 5 X = 10 L = 50
# C = 100 D = 500 M = 1000

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
  { character: 'V', value: 5 }, { character: 'I', value: 1 },
  { character: 'C', value: 100 }
]

# Get the number to convert
puts 'Enter an integer between 1 and about 3,000'
entered_number = gets.to_i

# Convert and show the number
puts roman_numeral(entered_number, roman)
