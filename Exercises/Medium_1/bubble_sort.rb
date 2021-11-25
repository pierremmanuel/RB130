require 'pry'

# Bubble Sort algorithm from previous exercise

# def bubble_sort!(array)
#   loop do
#     swapped = false
#
#     (0..array.size - 2).each do |i|
#       if array[i] > array[i + 1]
#         array[i], array[i + 1] = array[i + 1], array[i]
#         swapped = true
#       end
#     end
#
#     break unless swapped
#   end
#   nil
# end
#
#
# array = [5, 3]
# p bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]
#
# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)


# def bubble_sort!(array)
#   loop do
#     swapped = false
#
#     (0..array.size - 2).each do |i|
#       swap = block_given? ? yield(array[i], array[i + 1]) : array[i] > array[i + 1]
#       next if !swap
#       array[i], array[i + 1] = array[i + 1], array[i]
#       swapped = true
#     end
#
#     break unless swapped
#   end
#   nil
# end

# Further exploration

def bubble_sort!(arr)
  loop do
    swapped = false

    (0..arr.size - 2).each do |i|
      swap = block_given? ? yield(arr[i]) > yield(arr[i + 1]) : arr[i] > arr[i + 1]
      next if !swap
      arr[i], arr[i + 1] = arr[i + 1], arr[i]
      swapped = true
    end

    break unless swapped
  end
  nil
end


array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]
#
# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first <= second }
# p array == [7, 5, 3]
#
# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]
#
# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) > (second % 7) }
# p array == [14, 22, 12, 6, 27]
#
# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)
#
# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase > second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)
