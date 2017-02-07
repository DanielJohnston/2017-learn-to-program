# Read birthday files with dates and look up individual records

#Set constants
FILENAME = './chap12/sample_files/birthdays.txt'

# Read the file into memory
file_data = File.read FILENAME

# Break into individual records
birthdays = {}
file_records = file_data.split("\r\n")
file_records.each do |file_line|
  record = file_line.split(",")
  name = record[0]
  month_and_day = record[1].split(" ")
  birthdate = Time.new(record[2],month_and_day[0],month_and_day[1])
  birthdays[name] = birthdate
end

# Get a name, look up their birthdate and puts it
puts 'Enter a name to see their birthday'
name = gets.chomp
puts birthdays.values_at(name)
