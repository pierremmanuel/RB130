class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid triangle length" unless valid?
  end

  def kind
    return 'equilateral' if sides.uniq.size == 1
    return 'isosceles' if sides.uniq.size == 2
    'scalene'
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end

#my_triangle = Triangle.new(1, 1, 3)
