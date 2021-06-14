require_relative "hand"

class Player

  attr_accessor :hand, :name, :in_game, :dealer, :bet, :chips

  def initialize(name, dealer = false)
    @name = name
    @chips = 100
    @in_game = true
    @dealer = dealer
    @bet = 0
    @hand = Hand.new()
  end

  def to_s
    @name
  end

  def hit(card)
    @hand.add_card(card)
  end

  def get_play
    print "#{@name} would you like to hit(hit) or stand(any key)? "
    play = gets.chomp.downcase
  end

  def place_bet
    return if @dealer || !enough_chips?
    bet = get_bet

    until bet <= @chips
      puts "You don't have enough"
      bet = get_bet
    end
    @chips -= bet
    @bet = bet
  end

  def get_bet
    print "#{@name} place your bet: "
    bet = gets.chomp.to_i
    until bet > 0
      puts "Please enter a number greater than 0"
      print "#{@name} place your bet: "
      bet = gets.chomp.to_i
    end
    @bet = bet
  end

  def enough_chips?
    if @chips == 0
      @in_game = false
      return false
    end
    true
  end

  def display
    num_cards = @hand.cards.size
    num_cards.times do
      print_top
    end
    puts
    num_cards.times do
      print_layer_one
    end
    puts
    @hand.cards.each do |card|
      print_top_rank(card)
    end
    unless @dealer
      print "  "
      display_chips
    end
    puts
    @hand.cards.each do |card|
      print_suit(card)
    end
    unless @dealer
      print "  "
      display_bet
    end
    puts
    @hand.cards.each do |card|
      print_bottom_rank(card)
    end
    unless @dealer && !@hand.cards.last.show
      print "  "
      display_value
    end
    puts
    num_cards.times do
      print_bottom
    end
    puts
    puts
  end

  def print_top
    print " _______ "
  end

  def print_layer_one
    print_edge
    print_spaces
    print_edge
  end

  def print_bottom
    print "|_______|"
  end

  def print_edge
    print "|"
  end

  def print_spaces
    print " ".center(7)
  end

  def print_top_rank(card)
    print_edge
    unless card.show
      print_spaces
    else
      print "#{card.rank}".ljust(7)
    end
    print_edge
  end

  def print_suit(card)
    print_edge
    unless card.show
      print "   ?   "
    else
      print "   #{card.suit}   "
    end
    print_edge
  end

  def print_bottom_rank(card)
    print_edge
    unless card.show
      print_spaces
    else
      print "#{card.rank}".rjust(7)
    end
    print_edge
  end

    def display_bet
    print "Bet placed: #{@bet}"
  end
  
  def display_chips
    print "Chips: #{@chips}"
  end

  def display_value
    print "Cards value: #{@hand.get_value}"
  end
end