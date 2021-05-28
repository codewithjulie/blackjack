class Player

  attr_accessor :hand, :name, :dealer

  def initialize(name, dealer = false)
    @name = name
    @hand = []
    @dealer = dealer
  end

  def to_s
    @name
  end

  def display_hand
    print "#{@name} is holding: "
    @hand.each { |card| print "#{card}, " } 
    puts
  end

  def hand_value
    @hand.reduce(0) { |sum, card| sum + card.value }
  end

  def blackjack?
    hand_value == 21
  end

  def bust?
    hand_value > 21
  end

  def dealer_stand?
    hand_value > 16
  end

  def get_play
    print "#{@name} would you like to stand or hit? "
    play = gets.chomp.downcase
    until valid_play?(play)
      puts "I did not understand that input"
      print "#{@name} would you like to stand or hit? "
      play = gets.chomp.downcase
    end
    play
  end

  def valid_play?(play)
    play == "stand" || play == "hit"
  end


end

