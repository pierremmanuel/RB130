
# def factorial(n)
#   n == 0 ? 1 : (1...Float::INFINITY).first(n).reduce(&:*)
# end

# def factorial(n)
#   result = 1
#
#   (n + 1).times do |t|
#     result *= t if t > 0
#   end
#   result
# end
#
# p factorial(5)

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

# External iterator
p factorial.next

# Internatl iterator
factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end
