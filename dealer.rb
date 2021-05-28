class Dealer

  attr_accessor :hand

  def initialize
    @name = "Dealer"
    @hand = []
  end

  def display_hand
    print "#{@name} is holding: "
    print "#{@hand[0]} "
    print "CARD"
    puts
  end

  def face_up
    print "#{@name} is holding: "
    @hand.each { |card| print "#{card}, " } 
    puts
  end

  def hand_value
    @hand.reduce(0) { |sum, card| sum + card.value }
  end

  def dealer_stand?
    hand_value > 16
  end

  def blackjack?
    hand_value == 21
  end

  def bust?
    hand_value > 21
  end

end