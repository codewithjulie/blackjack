class Player

  attr_accessor :hand

  def initialize(name, dealer = false)
    @name = name
    @hand = []
    @dealer = dealer
  end

  def to_s
    "#{@name} is holding #{@hand.each {|card| print card}}"
  end




end