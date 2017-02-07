# Orange tree simulator

class OrangeTree

  def initialize
    @orange_count = 0
    @dead = false
    @height = 1
    @age = 0
    puts 'An orange tree is born!'
  end

  def height
    @height
  end

  def one_year_passes
    if @dead
      puts 'The tree slowly moulders'
    else
      # Increase height & age, reroll orange count, roll for death and notify
      message = 'The tree grows a year older.'
      @age += 1
      @height += 1
      message = 'The remaining oranges fall off, and are replaced by a fresh crop.' if @orange_count > 0
      @orange_count = rand([1, @age-4].max)
      if rand(@age) > 10
        @dead = true
        @orange_count = 0
        message = 'The tree dies.'
      end
      puts message
    end
  end

  def count_the_oranges
    @orange_count
  end

  def pick_an_orange
    if @orange_count > 0
      puts 'You pick an orange.'
      @orange_count -= 1
    else
      puts 'But there are no oranges to pick.'
      end
  end

end

# Control code
tree = OrangeTree.new
choice = '1'
until choice == 'q'
  puts 'What would you like to do?'
  puts '1) Pick an orange'
  puts '2) Wait a year'
  puts '3) Count the oranges'
  puts '4) Measure its height'
  puts 'q) Quit'
  choice = gets.chomp
  case choice
  when '1'
    tree.pick_an_orange
  when '2'
    tree.one_year_passes
  when '3'
    puts "There are #{tree.count_the_oranges} oranges."
  when '4'
    puts "The tree is #{tree.height}m high."
  end
end
