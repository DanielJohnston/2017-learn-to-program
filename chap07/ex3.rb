# Deaf grandma

your_sentence = ""
bye_total = 0
puts "AFTERNOON SONNY!"

until bye_total == 3
  your_sentence = gets.chomp
  if your_sentence == "BYE"
    bye_total += 1
  elsif your_sentence == your_sentence.upcase
    puts "NO, NOT SINCE " + (rand(99) + 1910).to_s + "!"
    bye_total = 0
  else
    puts "HUH?! SPEAK UP, SONNY!"
    bye_total = 0
  end
end
