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

  def natural?
    @hand.reduce(0) { |sum, card| sum + card.value } == 21

    # sum = 0
    # @hand.each do |card|
    #   sum += card.value
    # end
    # if sum == 21
    #   return true
    # else
    #   return false
    # end
  end

  def bust?
    sum = 0
    @hand.each do |card|
      sum += card.value
    end
    if sum > 21
      return true
    else
      return false
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