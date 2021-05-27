require_relative "card"

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    create_deck
  end

  def to_s
    "Deck of cards"
  end

  def draw
    @cards.pop
  end

  def create_deck
    suits = ["Spades", "Clubs", "Diamonds", "Hearts"]
    ranks = ["Ace", "King", "Queen", "Jack", "Ten", "Nine", "Eight", "Seven", "Six", "Five", "Four", "Three", "Two"]
    suits.each do |suit|
      ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle_deck
    @cards.shuffle!
  end

end

# I need 52 cards, 13 each suit, and values from 1-10, J, Q, K
# How do I shuffle the cards? 
# Do I draw a card from the deck?