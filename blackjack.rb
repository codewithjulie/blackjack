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
        player.hand << @deck.draw
      end
      @dealer.hand << @deck.draw
    end
  end

  def current_player
    @current_player
  end

  def next_player
    current_index = @players.find_index(@current_player)
    @current_player = @players[(current_index + 1)]
  end

  def get_player_play
    if @current_player.blackjack?
      return puts "You got Black Jack!".colorize(:green)
    else
      player_play = @current_player.get_play
      while player_play == "hit"
        player_hit(@current_player)
        if @current_player.bust?
          return puts "Sorry you busted".colorize(:red)
        elsif @current_player.blackjack?
          return puts "You got twenty-one!".colorize(:green)
        end
        player_play = @current_player.get_play
      end
    end
  end

  def player_hit(player)
    hit_card = @deck.draw
    puts "You just received a #{hit_card}"
    player.hand << hit_card
    print "You now have "
    player.hand.each {|card| print "#{card} "}
    puts
  end

  def dealer_play
    until @dealer.dealer_stand?
      player_hit(@dealer)
      if @dealer.bust?
        return puts "Dealer busted".colorize(:red)
      elsif @dealer.blackjack?
        return puts "Dealer got twenty-one!".colorize(:green)
      end
    end
  end

end