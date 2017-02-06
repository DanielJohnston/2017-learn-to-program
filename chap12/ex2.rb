# Birthday spanks

puts 'What year were you born?'
birth_year = gets.to_i
puts 'What month were you born (as a number)?'
birth_month = gets.to_i
puts 'What date of the month were you born (as a number)?'
birth_day = gets.to_i

now = Time.new

if (now.month > birth_month) || (birth_month == now.month && bnow.day >= birth_day)
  age_in_years = now.year - birth_year
else
  age_in_years = now.year - birth_year - 1
end

age_in_years.times { puts "SPANK!" }
