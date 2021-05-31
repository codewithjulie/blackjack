require_relative "hand"

class Player

  attr_accessor :hand, :name, :in_game, :dealer, :bet, :chips

  def initialize(name, dealer = false)
    @name = name
    @hand = Hand.new
    @chips = 100
    @in_game = true
    @dealer = dealer
    @bet = 0
  end

  def to_s
    @name
  end

  def get_play
    play = prompt_play
    until valid_play?(play)
      puts "I did not understand that input"
      play = prompt_play
    end
    play
  end

  def valid_play?(play)
    play == "stand" || play == "hit"
  end

  def prompt_play
    print "#{@name} would you like to stand or hit? "
    play = gets.chomp.downcase
  end

  def display_chips
    print "Chips: #{@chips}"
  end

  def place_bet(bet)
    if @chips == 0
      @in_game = false
      return
    end
    if bet < @chips
      @chips -= bet
      @bet = bet
    else
      puts "You don't have enough"
    end
  end

  def display_bet
    print "Bet placed: #{@bet}"
  end

end