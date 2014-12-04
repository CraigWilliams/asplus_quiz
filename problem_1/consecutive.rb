require_relative 'lib/character'
require_relative 'lib/character_collection'

class Consecutive

  def initialize(string)
    @string     = string.split.join
    @collection = CharacterCollection.new
  end

  def max_consecutive_characters
    build_matching_characters
    @collection.matched
  end

  private

  def build_matching_characters
    @string.each_char do |char|
      @collection.add char
    end
  end
end
