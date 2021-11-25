class CustomSet
  def initialize(set = [])
    @elements = set.uniq
  end

  def empty?
    @elements.empty?
  end

  def contains?(element)
    @elements.include?(element)
  end

  def subset?(other_set)
    elements.all? { |el| other_set.elements.include?(el) }
  end

  def disjoint?(other_set)
    elements.none? { |el| other_set.elements.include?(el) }
  end

  def eql?(other_set)
    elements.sort == other_set.elements.sort
  end
  alias_method :==, :eql?

  def add(element)
    elements.push(element) unless contains?(element)
    self
  end

  def intersection(other_set)
    self.class.new(elements & other_set.elements)
  end

  def difference(other_set)
    self.class.new(elements - other_set.elements)
  end

  def union(other_set)
    self.class.new(elements + other_set.elements)
  end

  protected

  attr_reader :elements
end
