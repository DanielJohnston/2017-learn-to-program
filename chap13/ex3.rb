# Interactive baby dragon

# Setup: initialize
# Interactions: feed, walk, put to bed, toss, rock
# Private: hungry?, poopy?, passage_of_time

class Dragon
  def initialize name
    @name = name
    @asleep = false
    @stuff_in_belly = 10
    @stuff_in_intestine = 0

    puts "#{@name} is born."
  end

  def feed
    puts "You feed #{@name}."
    @stuff_in_belly = 10
    passage_of_time
  end

  def walk
    puts "You walk #{@name}."
    @stuff_in_intestine = 0
    passage_of_time
  end

  def put_to_bed
    puts "You put #{@name} to bed."
    @asleep = true
    3.times do
      if @asleep
        passage_of_time
      end
      if @asleep
        puts "#{@name} snores, filling the room with smoke."
      end
    end
    if @asleep
      @asleep = false
      puts "#{@name} wakes up slowly."
    end
  end

  def toss
    puts "You toss #{@name} into the air."
    puts "He giggles, singing your eyebrows."
    passage_of_time
  end

  def rock
    puts "You rock #{@name} gently."
    @asleep = true
    puts "He briefly dozes off..."
    passage_of_time
    if @asleep
      @asleep = false
      puts "...but wakes up when you stop."
    end
  end

  private

  def hungry?
    @stuff_in_belly <= 2
  end

  def poopy?
    @stuff_in_intestine >= 8
  end

  def passage_of_time
    if @stuff_in_belly > 0
      @stuff_in_belly -= 1
      @stuff_in_intestine += 1
    else
      wake_if_asleep
      puts "#{@name} is starving. In desperation, he ate you!"
      exit
    end

    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts "Whoops. #{@name} has had a little accident."
    end

    if hungry?
      wake_if_asleep
      puts "#{@name}'s stomach grumbles."
    end

    if poopy?
      wake_if_asleep
      puts "#{@name} does the potty dance."
    end
  end

  def wake_if_asleep
    if @asleep
      @asleep = false
      puts "Your dragon wakes up suddenly."
    end
  end

end

# Control loop
puts 'Name your dragon!'
name = gets.chomp
dragon = Dragon.new name
action = ''

until action == 'q'
  puts 'What would you like to do?'
  puts '1) Feed the dragon'
  puts '2) Walk the dragon'
  puts '3) Put the dragon to bed'
  puts '4) Toss the dragon in the air'
  puts '5) Rock the dragon to sleep'
  puts 'q) Quit'
  action = gets.chomp
  case action
  when '1'
    dragon.feed
  when '2'
    dragon.walk
  when '3'
    dragon.put_to_bed
  when '4'
    dragon.toss
  when '5'
    dragon.rock
  end
end
