# def divisors(integer)
#   result = []
#   1.upto(integer) { |num| result << num if integer % num == 0 }
#   result
# end

def divisors(num)
    result = []
    (1..Math.sqrt(num)).to_a.each { |i| result << i if num % i == 0}
    result += result.map { |item| num / item}
    result.uniq.sort
end

=begin

To find all the divisors of a number;

1) find all the numbers (incremented by one), in between 1 and the square root of that number
2) filter all those number by selecting only those that are divisible by 0 (this is the first part of the result array)
3) in your result array, add up all results of dividing each number of the result array by the number.

=end

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
