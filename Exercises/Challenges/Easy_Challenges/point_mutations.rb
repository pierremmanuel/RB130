class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_dna)
    smaller_strand, larger_strand = [strand, other_dna.strand].sort_by(&:size)
    counter = 0

    smaller_strand.each_char.with_index do |char, index|
      counter += 1 if char != larger_strand[index]
    end

    counter
  end
end

hunter = DNA.new("GAGCCTACTAACGGGAT")
pierre = DNA.new("CATCGTAATGACGGC")

p pierre.hamming_distance(hunter)
