require_relative "deck"
require_relative "player"
require_relative "card"
require_relative "dealer"
require "colorize"

class BlackJack

  attr_accessor :players, :deck, :current_player, :dealer

  def initialize(players)
    @players = players
    @dealer = Player.new("Dealer", true)
    @deck = Deck.new
    shuffle
    @current_player = @players.first
  end

  def shuffle
    @deck.shuffle
  end

  def deal
    2.times do
      @players.each do |player|
        player.hand.hit(@deck.draw)
      end
      @dealer.hand.hit(@deck.draw)
    end
    unless @dealer.hand.value == 21
      @dealer.hand.cards.last.facedown = true
    end
  end

  def start
    @players.map {|player| player.bet = 0}
    @players.map {|player| player.hand = Hand.new}
    @players.map {|player| player.in_game = true}
    @dealer.hand = Hand.new
  end

  def current_player
    @current_player
  end

  def next_player
    current_index = @players.find_index(@current_player)
    @current_player = @players[(current_index + 1)]
  end

  def player_play
    return unless @current_player.in_game
    if @current_player.hand.blackjack?(@current_player)
      prompt_any_key
    else 
      player_call = @current_player.get_play
      while player_call == "hit"
        player_hit(@current_player)
        if @current_player.hand.blackjack?(@current_player) || @current_player.hand.bust?(@current_player)
          @current_player.in_game = false
          prompt_any_key
          return
        else
          player_call = @current_player.get_play
        end
      end
    end
  end

  def display_all_players_cards
    system("clear")
    @players.each do |player|
      puts "#{player} is holding: "
      player.hand.display(player)
    end
    puts "Dealer is holding: "
    @dealer.hand.display(@dealer)
  end 

  def player_hit(player)
    hit_card = @deck.draw
    puts "#{player} just received a #{hit_card}"
    player.hand.hit(hit_card)
    puts "#{player} now have "
    player.hand.display(player)
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
    unless @dealer.hand.blackjack?(@dealer)
      while @dealer.hand.dealer_hit?
        player_hit(@dealer)
        if @dealer.hand.bust?(@dealer) || @dealer.hand.blackjack?(@dealer)
          prompt_any_key
          return
        end
        prompt_any_key
      end
    end
  end

  def check_all_players_for_natural_blackjack
    @players.each do |player|
      if player.hand.value == 21
        puts "#{player} got BlackJack!".colorize(:green)
        player.in_game = false
        if @dealer.hand.value == 21
          payout(player, player.bet)
        else
          payout(player, player.bet * 1.5)
        end
      end
    end
    if @dealer.hand.value == 21
      puts "Dealer got BlackJack!".colorize(:green)
      prompt_any_key
    end
  end

  def round_over?
    @players.none? {|player| player.in_game} || @dealer.hand.value == 21
  end

  def place_bets
    @players.each do |player|
      print "#{player} place your bet: "
      bet = gets.chomp.to_i
      player.place_bet(bet)
    end
  end

  def payout(player, amount)
    player.chips += amount
  end

  def game_over?
    @players.all? {|player| player.chips == 0}
  end


end


=begin
0. User needs to put down bet prior to dealing cards
1. player gets natural blackjack and dealer does not == 1.5 pay to player
2. player gets natural blackjack and dealer has natural blackjack == take money back
3. player no natural blackjack and dealer has natural blackjack == dealer takes money
4. player gets twenty-one = 1.0 pay to player
5. dealer busts - all remaining players get 1.0 pay
6. player busts = dealer takes money


=end
