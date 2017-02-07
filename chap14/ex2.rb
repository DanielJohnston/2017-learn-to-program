# Grandfather clock - call proc once for each hour passed in current half-day

def grandfather &block
  hours_passed = ((Time.new.hour-1)%12)+1
  hours_passed.times {block.call}
end

grandfather do
  puts 'BONG!'
end
