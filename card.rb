class Card

  attr_reader :facedown, :suit, :rank, :value
  attr_writer :facedown

  def initialize(rank, suit, value)
    @suit = suit
    @rank = rank
    @value = value
    @facedown = false
  end

  def to_s
    "#{@rank}#{@suit}"
  end

  def flip_card
    @facedown = false
  end

  def change_ace_value
    if @rank == "A"
      @value = 1
    end
  end

end

# states track attributes for individual objects
# behaviors are what objects are capable of doing

