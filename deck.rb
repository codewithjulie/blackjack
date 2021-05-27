require_relative "card"

class Deck
  attr_accessor :cards

  SUITS = ["Spades", "Clubs", "Diamonds", "Hearts"]
  RANKS = ["Ace", "King", "Queen", "Jack", "Ten", "Nine", "Eight", "Seven", "Six", "Five", "Four", "Three", "Two"]
  VALUES = [11, 10, 10, 10, 10, 9, 8, 7, 6, 5, 4, 3, 2]
  
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
    SUITS.each do |suit|
      RANKS.each_with_index do |rank, index|
        @cards << Card.new(rank, suit, VALUES[index])
      end
    end
  end

  def shuffle_deck
    @cards.shuffle!
  end

end