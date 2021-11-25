class ScrabbleWord
  attr_reader :word

  POINTS = {
    'AEIOULNRST'=> 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
}
  def initialize(word)
    @word = word ? word : ""
  end

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '').chars

    letters.map do |letter|
      POINTS.find { |key, _| key.include?(letter) }.last
    end.sum
  end

  def self.score(word)
    ScrabbleWord.new(word).score
  end
end

test = ScrabbleWord.new('CABBAGE')
p test.score
