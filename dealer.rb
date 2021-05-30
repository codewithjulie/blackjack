require_relative "hand"

class Dealer < Player

  attr_accessor :hand

  def initialize(name = "Dealer")
    @name = name
    @hand = Hand.new
  end

end