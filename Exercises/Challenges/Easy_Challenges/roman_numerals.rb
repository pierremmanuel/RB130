# LS Solution

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end

# Second solution:

ROMANS = [["I", "V", "X"], ["X", "L", "C"], ["C", "D", "M"], ["M"]]

class RomanNumeral

  def initialize(number)
    unless number.between?(1, 3999)
      raise ArgumentError, "Can only compute numbers between 1 - 3999"
    end

    @number = number
  end

  def to_roman
    roman = ""
    @number.digits.each_with_index do |digit, idx|
      case digit
      when 1, 2, 3
        roman.prepend(ROMANS[idx][0] * digit)
      when 4
        roman.prepend(ROMANS[idx][0] + ROMANS[idx][1])
      when 5, 6, 7, 8
        roman.prepend(ROMANS[idx][1] + (ROMANS[idx][0] * (digit - 5)))
      when 9
        roman.prepend(ROMANS[idx][0] + ROMANS[idx][2])
      end
    end
    roman
  end
end

# Methods related to the exercise

def a_method(n)
  digits_array = n.digits.reverse
  s = digits_array.size

  digits_array.each_with_object([]) do |d, result|
    s -= 1
    next if d == 0
    result << (d * 10**(s))
    n %= result.last
  end
end

def b_method(number)
  s = number.digits.size
  result = []

  (0...s).reverse_each.with_object([]) do |power, result|
    multiplier, remainder = number.divmod(10**(power))
    result << multiplier * 10**(power) if multiplier > 0
    number = remainder
  end
end

# a = 1090
# p a_method(a)
# p a
# p b_method(a)
# p a
