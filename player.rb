class Player

  attr_accessor :hand, :name, :dealer

  def initialize(name, dealer = false)
    @name = name
    @hand = []
    @dealer = dealer
  end

  def to_s
    "#{@name} is a dealer? #{@dealer}"
  end

  def display_hand
    @hand.each do |card|
      print "#{card} "
    end
  end

  def get_play
    print "#{@name} would you like to stand or hit? "
    play = gets.chomp.downcase
    until play == "stand" || play == "hit"
      puts "I did not understand that input"
      print "#{@name} would you like to stand or hit? "
      play = gets.chomp.downcase
    end
    play
  end


end