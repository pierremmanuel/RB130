class Octal
  attr_reader :value

  def initialize(value)
    @value = value
    check_valid_octal
  end

  def base_ten
    value.to_i.digits.map.with_index { |digit, index| digit * 8**index }.sum.to_s
  end

  private

  def check_valid_octal
    raise ArgumentError, 'Invalid Octal number.'\
      unless value.chars.all? { |d| d =~ /[0-7]/ }
  end
end

my_number = Octal.new("233") # must return 155
p my_number.base_ten
