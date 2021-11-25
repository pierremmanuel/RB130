class PerfectNumber
  def self.classify(number)
    raise StandardError.new if number < 1
    sum = sum_of_factors(number)

    case sum
    when number then 'perfect'
    when (1...number) then 'deficient'
    else 'abundant'
    end
  end

  class << self
    private

    def sum_of_factors(number)
      (1...number).select { |d| number % d == 0 }.sum
    end
  end
end

p PerfectNumber.classify(28)
p PerfectNumber.classify(36)
p PerfectNumber.classify(13)
