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

  def get_play
    print "#{@name} would you like to stand or hit? "
    play = gets.chomp.downcase
    until play == "stand" || play == "s" || play == "hit" || play == "h"
      print "#{@name} would you like to stand or hit? "
      play = gets.chomp.downcase
    end
    play
  end


end