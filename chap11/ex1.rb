# Safer picture downloading / file renaming

# CD to the destination directory
Dir.chdir './chap11/sample_output/'

# Get source picture files
pic_names = Dir['../sample_files/*.png']

# Get rename destination name
puts 'What would you like to rename files to?'
batch_name = gets.chomp

puts
print "Downloading #{pic_names.length} files: "

pic_number = 1

pic_names.each do |name|
  print '.'
  new_name = if pic_number < 10
    "#{batch_name}0#{pic_number}.png"
  else
    "#{batch_name}#{pic_number}"
  end

  if File.exist? new_name
    puts "Failed trying to overwrite an existing file"
    exit
  else
    File.rename name, new_name
    pic_number += 1
  end
end

puts
puts 'All done!'
