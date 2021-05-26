require_relative "deck"

class BlackJack

  def initialize(players)
    @players = players
    @deck = Deck.new.shuffle_deck
  end

  def deal
    
  end


end