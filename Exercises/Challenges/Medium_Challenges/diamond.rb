class Diamond
  def self.make_diamond(letter)
    size = (letter.ord - 64) * 2 - 1
    outer_spaces = (size - 1) / 2
    letters = (("A"..letter).to_a + ("A"...letter).to_a.reverse).cycle

    print_upper_part(size, outer_spaces, letters)
    print_bottom_part(size, outer_spaces, letters)
  end

  class << self

    private

    def print_row(size, space, letter)
      optional_letter = (space * 2) == (size - 1) ? 0 : 1
      center_spaces = size - (1 + optional_letter) - (space * 2)
      row = "#{letter}" + " " * center_spaces + "#{letter}" * optional_letter
      puts row.center(size)
    end

    def print_upper_part(size, outer_spaces, letters)
      outer_spaces.downto(0) do |space|
        current_letter = letters.next
        print_row(size, space, current_letter)
      end
    end

    def print_bottom_part(size, outer_spaces, letters)
      1.upto(outer_spaces) do |space|
        current_letter = letters.next
        print_row(size, space, current_letter)
      end
    end
  end
end



Diamond.make_diamond("A")
Diamond.make_diamond("B")
Diamond.make_diamond("C")
