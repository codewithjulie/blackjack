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
    "#{@rank} of #{@suit}"
  end

end