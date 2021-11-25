def drop_while(array)
  array.inject(0) do |index, number|
    yield(number) ? index += 1 : (return array[index..-1])
  end
  []
end

# ALTERNATE SOLUTIONS

# def drop_while(array)
#   (0...array.size).each { |idx| return array[idx..-1] unless yield(array[idx]) }
#   []
# end

# def drop_while(array)
#   index = 0
#   while index < array.size && yield(array[index])
#     index += 1
#   end
#
#   array[index..-1]
# end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
