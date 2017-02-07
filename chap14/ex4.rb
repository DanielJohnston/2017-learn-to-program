# Better program logger, with indents on each call

$nesting_depth = 0

def log description, &block
  puts "#{' ' * $nesting_depth}Beginning '#{description}'"
  $nesting_depth += 2
  response = block.call
  $nesting_depth -= 2
  puts "#{' ' * $nesting_depth}Finished '#{description}' returning:"
  puts "#{' ' * $nesting_depth}#{response}"
end

log 'outer block' do
  log 'some little block' do
    log 'a teeny tiny block' do
      'lots of love'
    end
    5
  end
  log 'yet another block' do
    'I like Thai food!'
  end
  false
end
