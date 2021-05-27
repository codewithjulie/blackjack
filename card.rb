class Card

  attr_reader :value

  def initialize(rank, suit, value)
    @suit = suit
    @rank = rank
    @value = value
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

end