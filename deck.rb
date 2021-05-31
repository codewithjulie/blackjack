require_relative "card"
require "colorize"

class Deck
  attr_accessor :cards
  SUITS = {
    "Spades" => "\u2664",
    "Hearts" => "\u2665".colorize(:red),
    "Clubs" => "\u2667",
    "Diamonds" => "\u2666".colorize(:red)
  }

  RANKS = ["A", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
  RANKS_VALUES = {"A" => 11, "K" => 10, "Q" => 10, "J" => 10, "10" => 10, "9" => 9, "8" => 8, "7" => 7, "6" => 6, "5" => 5, "4" => 4, "3" => 3, "2" => 2}

  def initialize
    @cards = []
    self.create
  end

  def draw
    @cards.pop
  end

  def create
    SUITS.each do |suit, icon|
      RANKS.each do |rank|
        @cards << Card.new(rank, icon, RANKS_VALUES[rank])
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

end