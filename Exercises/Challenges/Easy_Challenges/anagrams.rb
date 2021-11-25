class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(array)
    sorted_word = word.downcase.chars.sort.join

    array.select { |w| w.downcase.chars.sort.join == sorted_word }
  end
end
