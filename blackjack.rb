require_relative "deck"
require_relative "player"
require_relative "card"
require_relative "dealer"
require "colorize"

class BlackJack

  attr_accessor :players, :deck, :current_player, :dealer

  def initialize(players)
    @players = players
    @dealer = Dealer.new
    @deck = Deck.new
    shuffle
    @current_player = @players.first
  end

  def shuffle
    @deck.shuffle_deck
  end

  def deal
    2.times do
      @players.each do |player|
        player.hand.hit(@deck.draw)
      end
      @dealer.hand.hit(@deck.draw)
    end
    @dealer.hand.cards.last.facedown = true
  end

  def current_player
    @current_player
  end

  def next_player
    current_index = @players.find_index(@current_player)
    @current_player = @players[(current_index + 1)]
  end

  def player_play
    unless @current_player.hand.blackjack?
      player_call = @current_player.get_play
      while player_call == "hit"
        player_hit(@current_player)
        unless @current_player.hand.blackjack? || @current_player.hand.bust?
          player_call = @current_player.get_play
        end
        return
      end
    end
  end

  def player_hit(player)
    hit_card = @deck.draw
    puts "You just received a #{hit_card}"
    player.hand.hit(hit_card)
    puts "You now have "
    player.hand.display
    puts
  end

  def dealer_play
    @dealer.hand.cards.last.flip_card
    @dealer.hand.display
    unless @dealer.hand.blackjack?
      while @dealer.hand.dealer_hit?
        player_hit(@dealer)
        if @dealer.hand.bust? || @dealer.hand.blackjack?
          return
        end
      end
    end
  end
end

=begin

When it is dealer's turn
1. Check if dealer has blackjack (change this to check if dealer has blackjac when A is face up card)
2. Check if dealer is < 17, if so then hit

6. Check if dealer is < 17 if yes then hit, if not then check if dealer has blackjack or bust

=end