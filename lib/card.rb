class Card
  attr_reader :suit, :rank, :value
  attr_accessor :show

  def initialize(rank, suit, value)
    @suit = suit
    @rank = rank
    @value = value
    @show = true
  end

  def to_s
    if @show
      "#{@rank}#{@suit}"
    else
      "?"
    end
  end

  def flip_card
    @show = !@show
  end

end
