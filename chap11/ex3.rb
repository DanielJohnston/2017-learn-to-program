# Deliberately disjointed playlists, rather than purely random ones

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

# New shuffle method that skews away from consecutive songs in same directories
def music_shuffle to_be_shuffled
  # First, randomise the list
  to_be_shuffled = shuffle to_be_shuffled
  # Compare filename to 1st / last file in each array, send to most dissimilar
  to_be_shuffled.reduce([]) do |playlist, song_file|
    if playlist == []
      playlist << song_file
    elsif shared_route(playlist.first, song_file) < shared_route(playlist.last, song_file)
      playlist.unshift song_file
    else
      playlist << song_file
    end
  end
end

# Compare similarity of two filenames (inc. directories)
def shared_route filename_1, filename_2
  shared_characters = 0
  until (filename_1[0..shared_characters] != filename_2[0..shared_characters]) || shared_characters >= filename_1.length || shared_characters >= filename_2.length
    shared_characters += 1
  end
  return shared_characters
end

# CD to the destination directory
Dir.chdir './chap11/sample_output/'

# Get all of the music file names in shuffled order
song_list = music_shuffle Dir['../sample_music_files/*/*.ogg']

# Open an m3u playlist and output the new playlist
filename = 'disjointed_playlist.m3u'
File.open filename, 'w' do |f|
    f.write song_list.reduce { |list, song| list + "\n" + song }
end
