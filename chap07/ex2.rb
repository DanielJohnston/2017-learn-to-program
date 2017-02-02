# Deaf grandma

your_sentence = ""
puts "AFTERNOON SONNY!"

until your_sentence == "BYE"
  your_sentence = gets.chomp
  if your_sentence == your_sentence.upcase
    puts "NO, NOT SINCE " + (rand(99) + 1910).to_s + "!"
  else
    puts "HUH?! SPEAK UP, SONNY!"
  end
end
