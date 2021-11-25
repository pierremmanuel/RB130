# def each_with_index(array)
#   index = 0
#   array.each do |item|
#     yield(item, index)
#     index +=1
#   end
#   array
# end

def each_with_index(array)
  array.inject(0) { |index, item| yield(item, index); index += 1 }
  array
end


result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
