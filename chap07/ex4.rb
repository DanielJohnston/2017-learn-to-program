# Leap years

# Write a program that asks for a starting year and an ending
# year and then puts all the leap years between them (and including them,
# if they are also leap years). Leap years are years divisible by 4
# (like 1984 and 2004). However, years divisible by 100 are not leap years (such as
# 1800 and 1900) unless they are also divisible by 400 (such as 1600 and
# 2000, which were in fact leap years). What a mess!

puts "Starting Year?"
starting_year = gets.to_i
puts "Finishing Year?"
finishing_year = gets.to_i

(starting_year..finishing_year).each do |year|
  if (year % 4 == 0) && (!(year % 100 == 0) || (year % 400) == 0)
    puts year
  end
end
