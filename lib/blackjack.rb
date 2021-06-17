require_relative "deck"
require_relative "player"
require_relative "card"
require_relative "dealer"
require "colorize"
require 'active_record'

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
    unless active_players.empty?
      display_all_players_cards
      active_players.each do |player| 
        player_play(player) if player.in_game
      end
      dealer_play
    end
  end


  def start
    system("clear")
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
    @dealer.hand.cards.last.flip_card
    display_all_players_cards
    check_all_players_for_natural_blackjack
  end

  def active_players
    @players.select {|player| player.in_game}
  end

  def player_play(player)
    system("clear")
    display_all_players_cards
    player_call = player.get_play
    while player_call == "hit"
      hit(player)
      if player.hand.get_value == 21
        puts "#{player} has twenty-one".colorize(:green)
        prompt_any_key
        return
      elsif player.hand.bust?
        player.in_game = false
        puts "#{player} busted".colorize(:red)
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
    display_all_players_cards
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
    return prompt_any_key if active_players.empty?
    while true
      if @dealer.hand.get_value < 17
        hit(@dealer)
        sleep(1)
      elsif @dealer.hand.bust?
        puts "Dealer busted".colorize(:red)
        prompt_any_key
        active_players.each {|player| payout(player, player.bet * 2)}
        return
      else
        active_players.each do |player|
          if player.hand.get_value > @dealer.hand.get_value
            payout(player, player.bet * 2)
          elsif player.hand.get_value == @dealer.hand.get_value
            payout(player, player.bet)
          else
            prompt_any_key
          end
        end
        return
      end
    end
  end

  def check_all_players_for_natural_blackjack
    @players.each do |player|
      if player.hand.blackjack?
        puts "#{player} got Blackjack!".colorize(:green)
        prompt_any_key
        if @dealer.hand.blackjack?
          puts "Dealer got Blackjack!".colorize(:green)
          payout(player, player.bet)
        else
          payout(player, (player.bet * 2.5).to_i)
        end
      end
    end
    if @dealer.hand.blackjack?
      @dealer.hand.cards.last.flip_card
      display_all_players_cards
      puts "Dealer got Blackjack!".colorize(:green)
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
    display_all_players_cards
    player.in_game = false
    puts "#{player} received #{amount} chips".colorize(:green)
    prompt_any_key
  end

  def game_over?
    @players.all? {|player| player.chips == 0}
  end

end