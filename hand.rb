require "colorize"

class Hand

  attr_accessor :cards, :value

  def initialize
    @cards = []
    @value = 0
  end

  def hit(card)
    @cards << card
    @value += card.value
  end

  def blackjack?(player)
    if @value == 21 && @cards.size == 2
      puts "#{player} got Blackjack!".colorize(:green)
      return true
    elsif @value == 21 && @cards.size > 2
      puts "#{player} got twenty-one!".colorize(:green)
      return true
    end
    return false
  end

  def bust?(player)
    if @value > 21
      puts "#{player} busted".colorize(:red)
      return true
    else
      return false
    end
  end

  def dealer_hit?
    @value <= 16
  end

  def display(player)
    num_cards = @cards.size
    num_cards.times do
      print_top
    end
    puts
    num_cards.times do
      print_layer_one
    end
    puts
    @cards.each do |card|
      print_top_rank(card)
    end
    unless player.dealer
      print "  "
      player.display_chips
    end
    puts
    @cards.each do |card|
      print_suit(card)
    end
    unless player.dealer
      print "  "
      player.display_bet
    end
    puts
    @cards.each do |card|
      print_bottom_rank(card)
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
    if card.facedown
      print_spaces
    else
      print "#{card.rank}".ljust(7)
    end
    print_edge
  end

  def print_suit(card)
    print_edge
    if card.facedown
      print "   ?   "
    else
      print "   #{card.suit}   "
    end
    print_edge
  end

  def print_bottom_rank(card)
    print_edge
    if card.facedown
      print_spaces
    else
      print "#{card.rank}".rjust(7)
    end
    print_edge
  end
end