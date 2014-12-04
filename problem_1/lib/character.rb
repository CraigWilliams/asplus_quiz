class Character
  attr_reader :char, :count

  def initialize(char)
    @char  = char
    @count = 1
  end

  def increment
    @count += 1
  end
end
