
def stock_picker(array)
  index = 0
  top_results = []
  bottom_results = []

  while index < array.length

    if array[index - 1] < 0
      top_results.push(array[index])
      index+=1
    elsif array[index] < array[index - 1]
      top_results.push(array[index - 1])
      bottom_results.push(array[index])
      index+=1
    else
      top_results.push(array[index])
      bottom_results.push(array[index - 1].to_i)
      index+=1
    end

  end
  sorted_top = top_results.sort {|a,b| b.to_i <=> a}
  sorted_bottom = bottom_results.sort

  highest_day = array.find_index(sorted_top[0]).to_i
  lowest_day= array.find_index(sorted_bottom[0]).to_i

  if highest_day > lowest_day
    highest_day = array.find_index(sorted_top[1]).to_i
    lowest_day = array.find_index(sorted_bottom[0]).to_i
    top_amount = sorted_top[1]
    lowest_amount = sorted_bottom[0]
  elsif lowest_day == array.length
    lowest_day = array.find_index(sorted_bottom[1])
    highest_day = array.find_index(sorted_top[0])
    lowest_amount = sorted_bottom[1]
    top_amount = sorted_top[0]
  else
    lowest_amount = sorted_bottom[0]
    top_amount = sorted_top[0]
  end

  selection = array.join("  |  ")
  puts ' '
  puts "#{selection}"
  puts " "
  puts "The best day to Buy stocks would be day #{lowest_day} of this week they will cost: #{lowest_amount}"
  puts ' '
  puts "The best day to Sell stocks would be day #{highest_day} of this week they will cost: #{top_amount}"
  puts ' '
end

puts "Starting Stock Picker..."
puts "------------------------"

array = []
day = 0

7.times do
  print "Day #{day}: "
  array.push(gets.chomp.to_i)
  day += 1
end

stock_picker(array)
