class Dealer < Player

  attr_accessor :hand

  def initialize(name = "Dealer")
    @name = name
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

  def dealer_stand?
    hand_value > 16
  end
end