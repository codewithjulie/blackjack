require_relative "deck"
require_relative "player"
require_relative "blackjack"


game = BlackJack.new([Player.new("Bob"), Player.new("Mary")])

game.deal

game.players.each do |player|
  puts "#{player} is holding: "
  player.hand.display
end
puts "Dealer is holding: "
game.dealer.hand.display

while game.current_player
  game.player_play
  game.players.each do |player|
    player.hand.display
  end
  game.next_player
end

game.dealer_play