# Note, this is identical to chap 06 ex2, as I exceeded the original spec

# Table of contents
LINE_WIDTH = 79

# Some sample data
table_of_contents = [
  {chapter_number: 1, chapter_title: 'Getting Started', page_number: 1},
  {chapter_number: 2, chapter_title: 'Numbers', page_number: 9},
  {chapter_number: 3, chapter_title: 'Letters', page_number: 13},
  {chapter_number: 4, chapter_title: 'Variables and Assignment', page_number: 22},
  {chapter_number: 5, chapter_title: 'Mixing It Up', page_number: 27},
  {chapter_number: 6, chapter_title: 'More About Methods', page_number: 40},
  {chapter_number: 7, chapter_title: 'Flow Control', page_number: 52},
  {chapter_number: 8, chapter_title: 'Arrays and Iterators', page_number: 60},
  {chapter_number: 9, chapter_title: 'Writing Your Own Methods', page_number: 129}
]

#The display code
puts "Table of Contents".center(LINE_WIDTH)
table_of_contents.each do |chapter|
  puts "Chapter " + chapter[:chapter_number].to_s.ljust(5) + chapter[:chapter_title].to_s.center(LINE_WIDTH-23) + "page " + chapter[:page_number].to_s.rjust(5)
end
