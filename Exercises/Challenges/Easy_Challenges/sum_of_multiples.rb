class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = (multiples.size > 0) ? multiples : [3, 5]
  end

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def to(number)
    multiples.each_with_object([]) do |n, result|
      (1...number).each do |k|
        break if (n * k) >= number
        result << (n * k) unless result.include?(n * k)
      end
    end.sum
  end

# other solution
  # def to(num)
  #   (1...num).select do |current_num|
  #     any_multiple?(current_num)
  #   end.sum
  # end
  #
  # private
  #
  # def any_multiple?(num)
  #   multiples.any? do |multiple|
  #     (num % multiple).zero?
  #   end
  # end

end

p SumOfMultiples.to(4)
p SumOfMultiples.to(10)
p SumOfMultiples.to(100)

p SumOfMultiples.new([4, 6]).to(15)
