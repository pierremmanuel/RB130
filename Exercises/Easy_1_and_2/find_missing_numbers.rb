def missing(array)
  result = []
  array.first.upto(array.last) { |num| result << num unless array.include?(num) }
  result
end

# def missing(arr)
#     (arr.first...arr.last).to_a - arr
# end


# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5]) #== [2, 3, 4]
p missing([6]) #== []
