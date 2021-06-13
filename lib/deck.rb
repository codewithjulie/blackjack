require_relative "card"
require "colorize"

class Deck
  attr_accessor :cards, :deck

  SUITS = {
    "Spades" => "\u2664",
    "Hearts" => "\u2665".colorize(:red),
    "Clubs" => "\u2667",
    "Diamonds" => "\u2666".colorize(:red)
  }

  RANKS = {"A" => 11, "K" => 10, "Q" => 10, "J" => 10, "10" => 10, "9" => 9, "8" => 8, "7" => 7, "6" => 6, "5" => 5, "4" => 4, "3" => 3, "2" => 2}

  def initialize
    @deck = []
    create_deck
  end

  def create_deck
    SUITS.each do |suit_word, suit_icon|
      RANKS.each do |rank, value|
        @deck << Card.new(rank, suit_icon, value)
      end
    end
  end

  def shuffle
    @deck.shuffle!
  end

  def deal_card
    @deck.pop
  end

end