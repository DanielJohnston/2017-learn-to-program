# Create a shuffled playlist

# Shuffle method from chapter 10 ex 1
def shuffle to_be_shuffled
  left_array = []
  right_array = []
  # Place each item into left or right hand list at random
  to_be_shuffled.each do |item|
    if rand(2) == 1
      left_array << item
    else
      right_array << item
    end
  end

  # Shuffle the left and right lists if they're bigger than 1 item
  left_array = shuffle(left_array) if left_array.length >1
  right_array = shuffle(right_array) if right_array.length >1

  return [left_array, right_array].flatten
end

# CD to the destination directory
Dir.chdir './chap11/sample_output/'

# Get all of the music file names in shuffled order
song_list = shuffle Dir['../sample_music_files/*/*.ogg']

# Open an m3u playlist and output the new playlist
filename = 'playlist.m3u'
File.open filename, 'w' do |f|
    f.write song_list.reduce { |list, song| list + "\n" + song }
end
