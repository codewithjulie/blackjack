require_relative "deck"
require_relative "player"
require_relative "card"
require_relative "dealer"
require "colorize"

class Blackjack

  attr_accessor :players, :deck, :current_player, :dealer

  def initialize(players)
    @players = players
    @dealer = Player.new("Dealer", true)
    @deck = Deck.new
    @deck.shuffle
  end

  def play_round
    start
    place_bets
    deal
    system("clear")
    display_all_players_cards
    active_players.each do |player| 
      player_play(player) if player.in_game
    end
    dealer_play
    prompt_any_key
  end

  def start
    @players.each do |player|
      player.bet = 0
      player.hand = Hand.new
      player.in_game = true
    end
    @dealer.hand = Hand.new
  end

  def deal
    2.times do
      active_players.each {|player| player.hit(@deck.deal_card)}
      @dealer.hit(@deck.deal_card)
    end
    @dealer.hand.cards.last.show = false
    display_all_players_cards
    check_all_players_for_natural_blackjack
  end

  def active_players
    @players.select {|player| player.in_game}
  end

  def player_play(player)
    system("clear")
    display_all_players_cards
    return if player.hand.blackjack?(player)
    player_call = player.get_play
    while player_call == "hit"
      hit(player)
      if player.hand.blackjack?(player)
        payout(player, player.bet * 2)
        return
      elsif player.hand.bust?(player)
        prompt_any_key
        return
      else
        player_call = player.get_play
      end
    end
  end

  def display_all_players_cards
    system("clear")
    active_players.each do |player|
      puts "#{player} is holding: "
      player.display
    end
    puts "Dealer is holding: "
    @dealer.display
  end 

  def hit(player)
    player.hit(@deck.deal_card)
    puts "#{player} now has "
    player.display
    puts
  end

  def prompt_any_key
    puts "Press any key to continue"
    gets.chomp
  end

  def dealer_play
    @dealer.hand.cards.last.flip_card
    display_all_players_cards
    sleep(1)
    return if active_players.empty?
    unless @dealer.hand.blackjack?(@dealer)
      while true
        if @dealer.hand.get_value < 17
          hit(@dealer)
        elsif @dealer.hand.bust?(@dealer)
          active_players.each {|player| payout(player, player.bet * 2)}
          return
        elsif @dealer.hand.blackjack?(@dealer)
          prompt_any_key
          return
        else
          active_players.each do |player|
            if player.hand.get_value > @dealer.hand.get_value
              payout(player, player.bet * 2)
            elsif player.hand.get_value == @dealer.hand.get_value
              payout(player, player.bet)
            end
          end
          return
        end
      end
    end
  end

  def check_all_players_for_natural_blackjack
    @players.each do |player|
      if player.hand.blackjack?(player)
        prompt_any_key
        if @dealer.hand.blackjack?(@dealer)
          payout(player, player.bet)
        else
          payout(player, player.bet * 2.5)
        end
      end
    end
    if @dealer.hand.blackjack?(@dealer)
      @dealer.hand.cards.last.flip_card
      @players.map {|player| player.in_game = false}
      prompt_any_key
    end
  end

  def place_bets
    @players.each do |player|
      player.place_bet
    end
  end

  def payout(player, amount)
    player.chips += amount
    player.in_game = false
    puts "#{player} received #{amount}"
    prompt_any_key
  end

  def game_over?
    @players.all? {|player| player.chips == 0}
  end

end