require_relative "deck"
require_relative "player"
require_relative "card"

class BlackJack

  attr_accessor :players, :deck, :current_player

  def initialize(players)
    @players = players
    @players << Player.new("Dealer", true)
    @deck = Deck.new
    shuffle
    @current_player = @players.first
  end

  def shuffle
    @deck.shuffle_deck
  end

  def deal
    @players.each do |player|
      player.hand << @deck.draw
    end
    @players.each do |player|
      player.hand << @deck.draw
    end
  end

  def current_player
    @current_player
  end

  def next_player
    current_index = @players.find(@current_player)
    @current_player = @players[(current_index + 1)]
  end

end