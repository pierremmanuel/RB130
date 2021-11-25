# def max_by(array)
#   result = nil
#   return array.first if array.size == 1
#
#   array.each_with_index do |item, index|
#     break if index == array.size - 2 || array.empty?
#     comparison = yield(item) <=> yield(array[index + 1])
#     result = comparison == -1 ? array[index + 1] : item
#   end
#
#   result
# end

def max_by(array)
  array.inject(array.first) do |result, value|
    (yield(result) <=> yield(value)) == 1 ? result : value
  end
end

# LS SOLUTION

# def max_by(array)
#   return nil if array.empty?
#
#   max_element = array.first
#   largest = yield(max_element)
#
#   array[1..-1].each do |item|
#     yielded_value = yield(item)
#     if largest < yielded_value
#       largest = yielded_value
#       max_element = item
#     end
#   end
#
#   max_element
# end


p max_by([1, 5, 3]) { |value| value + 2 } #== 5
p max_by([1, 5, 3]) { |value| 9 - value } #== 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } #== 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } #== [3, 4, 5]
p max_by([-7]) { |value| value * 3 } #== -7
p max_by([]) { |value| value + 5 } #== nil
