require_relative "deck"
require_relative "player"
require_relative "blackjack"


game = BlackJack.new([Player.new("Bob"), Player.new("Mary")])

game.deal

# game.check_all_players_for_natural_blackjack

system("clear")
game.players.each do |player|
  puts "#{player} is holding: "
  player.hand.display
end
puts "Dealer is holding: "
game.dealer.hand.display

while game.current_player
  game.player_play
  game.display_all_players_cards
  game.next_player
end

game.dealer_play
puts "Press any key to continue"
gets.chomp

game.display_all_players_cards



=begin

1. deal cards
2. if dealer has natural blackjack, take all chips, but if another player has natural black jack - then they tie and no chips taken
3. if any player has natural blackjack, they get 1.5 num of chips, and they end their play
4. 

=end