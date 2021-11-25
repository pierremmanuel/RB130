class BeerSong
  def self.verses(maximum, minimum)
    (minimum..maximum).reverse_each.with_object ([]) do |num, lyrics|
      lyrics << verse_string(num)
    end.join("\n")
  end

  def self.verse(number)
    verse_string(number)
  end

  def self.lyrics
    self.verses(99, 0)
  end

  class << self

    private
    def verse_string(number)
      case number
      when 2
        "2 bottles of beer on the wall, 2 bottles of beer.\n" +
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      when 1
        "1 bottle of beer on the wall, 1 bottle of beer.\n" +
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      when 0
        "No more bottles of beer on the wall, no more bottles of beer.\n" +
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      else
        "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" +
        "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
      end
    end
  end
end

# LAUNCH SCHOOL SOLUTION

# class Verse
#   attr_reader :bottles
#
#   def initialize(bottles)
#     @bottles = bottles
#   end
#
#   def single_verse
#     case bottles
#     when 0
#       zero_bottle_verse
#     when 1
#       single_bottle_verse
#     when 2
#       two_bottle_verse
#     else
#       default_verse
#     end
#   end
#
#   private
#
#   def default_verse
#     "#{bottles} bottles of beer on the wall, #{bottles}" +
#     " bottles of beer.\nTake one down and pass it around, " +
#     "#{bottles-1} bottles of beer on the wall.\n"
#   end
#
#   def two_bottle_verse
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" +
#     "Take one down and pass it around, 1 bottle of beer " +
#     "on the wall.\n"
#   end
#
#   def single_bottle_verse
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" +
#     "Take it down and pass it around, no more bottles of beer " +
#     "on the wall.\n"
#   end
#
#   def zero_bottle_verse
#     "No more bottles of beer on the wall, no more bottles " +
#     "of beer.\nGo to the store and buy some more, 99 bottles " +
#     "of beer on the wall.\n"
#   end
# end
#
# class BeerSong
#   def self.verse(number)
#     Verse.new(number).single_verse
#   end
#
#   def self.verses(start, stop)
#     current_verse = start
#     result = []
#
#     while current_verse >= stop
#       result << "#{verse(current_verse)}"
#       current_verse -= 1
#     end
#
#     result.join("\n")
#   end
#
#   def self.lyrics
#     verses(99, 0)
#   end
# end
#
# puts BeerSong.verses(5, 0)
