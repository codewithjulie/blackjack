class Hand

  attr_accessor :cards

  def initialize
    @cards = []
  end

  def draw(card)
    @cards << card
  end

  def value
    @cards.reduce(0) {|sum, card| sum + card.value}
  end

  def blackjack?
    value == 21
  end

  def bust?
    value > 21
  end

  def dealer_stand?
    value > 16
  end

  def display
    num_cards = @cards.size
    num_cards.times do
      print_top
    end
    puts
    num_cards.times do
      print_edge
      print_spaces
      print_edge
    end
    puts
    @cards.each do |card|
      print_edge
      if card.facedown
        print_top_rank(" ")
      else
        print_top_rank(card.rank)
      end
      print_edge
    end
    puts
    @cards.each do |card|
      print_edge
      if card.facedown
        print_suit("?")
      else
        print_suit(card.suit)
      end
      print_edge
    end
    puts
    @cards.each do |card|
      print_edge
      if card.facedown
        print_bottom_rank(" ")
      else
        print_bottom_rank(card.rank)
      end
      print_edge
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

  def print_bottom
    print "|_______|"
  end

  def print_edge
    print "|"
  end

  def print_spaces
    print " ".center(7)
  end

  def print_top_rank(rank)
    print "#{rank}".ljust(7)
  end

  def print_suit(suit)
    print "   #{suit}   "
  end

  def print_bottom_rank(rank)
    print "#{rank}".rjust(7)
  end
end