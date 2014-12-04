class CharacterCollection

  def initialize
    @collection = []
  end

  def add(char)
    if empty_or_unequal(char)
      @collection << Character.new(char)
    else
      filter(char).increment
    end
  end

  def matched
    matching_max.map(&:char).sort.uniq
  end

  private

  def empty_or_unequal(char)
    @collection.empty? || @collection[-1].char != char
  end

  def filter(char)
    @collection.select { |character| character.char == char }.last
  end

  def matching_max
    matched = @collection.select { |character| character.count == max.count }
    ( matched + Array(max) ).flatten
  end

  def max
    @max ||= @collection.sort_by(&:count).last
  end
end
