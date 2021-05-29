require_relative "hand"

class Dealer < Player

  attr_accessor :hand

  def initialize(name = "Dealer")
    @name = name
    @hand = Hand.new
  end

  def face_up
    print "#{@name} is holding: "
    @hand.each { |card| print "#{card}, " } 
    puts
  end

end