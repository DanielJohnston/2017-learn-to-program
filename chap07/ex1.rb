# 99 bottles of beer on the wall

number_of_bottles = 99

97.times do |bottles_dropped|
  puts "#{99 - bottles_dropped} bottles, sitting on the wall"
  puts "#{99 - bottles_dropped} bottles, sitting on the wall"
  puts "and if 1 green bottle, should accidentally fall"
  puts "there'd be #{98-bottles_dropped} green bottles, sitting on the wall"
end

puts "2 green bottles, sitting on the wall\n2 green bottles, sitting on the wall\nand if 1 green bottle, should accidentally fall\nthere'd be 1 green bottle, sitting on the wall"
puts "1 green bottle, sitting on the wall\n1 green bottle, sitting on the wall\nand if 1 green bottle, should accidentally fall\nthere'd be no green bottles, sitting on the wall"
