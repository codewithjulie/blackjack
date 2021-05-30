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
        if @current_player.hand.blackjack? || @current_player.hand.bust?(@current_player)
          @current_player.in_game = false
          puts "Press any key to continue"
          gets.chomp
          return
        else
          player_call = @current_player.get_play
        end
      end
      puts "Press any key to continue"
      gets.chomp
    end
  end

  def display_all_players_cards
    system("clear")
    @players.each do |player|
      if player.in_game
        puts "#{player} is holding: "
        player.hand.display
      end
    end
    puts "Dealer is holding: "
    @dealer.hand.display
  end 

  def player_hit(player)
    hit_card = @deck.draw
    puts "#{player} just received a #{hit_card}"
    player.hand.hit(hit_card)
    puts "#{player} now have "
    player.hand.display
    puts
  end

  def dealer_play
    @dealer.hand.cards.last.flip_card
    @dealer.hand.display
    unless @dealer.hand.blackjack?
      while @dealer.hand.dealer_hit?
        player_hit(@dealer)
        if @dealer.hand.bust?(@dealer) || @dealer.hand.blackjack?
          return
        end
      end
    end
  end

  def check_all_players_for_natural_blackjack
    @players.each do |player|
      if player.hand.value == 21
        puts "#{player} got BlackJack!".colorize(:green)
      end
    end
    if @dealer.hand.value == 21
      puts "Dealer got BlackJack!".colorize(:green)
    end
  end

end