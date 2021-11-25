def zip(array, array2)
  raise ArgumentError, "Arrays are not the same size." if array.size != array2.size

  (0...array.size).map { |i| [array[i], array2[i]] }
end


p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
