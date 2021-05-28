class Card

  attr_reader :value, :facedown

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