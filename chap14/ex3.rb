# Program logger - method puts bookends on block, and the returned data

def log description, &block
  puts "Beginning '#{description}'"
  response = block.call
  puts "Finished '#{description}' returning:"
  puts response
end

log 'outer block' do
  log 'some little block' do
    5
  end
  log 'yet another block' do
    'I like Thai food!'
  end
  false
end
