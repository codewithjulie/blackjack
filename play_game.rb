require_relative "deck"
require_relative "player"
require_relative "blackjack"


game = BlackJack.new([Player.new("Bob"), Player.new("Mary")])

game.deal

game.players.each do |player|
  player.display_hand
end
game.dealer.display_hand

while game.current_player
  game.get_player_play
  game.players.each do |player|
    player.display_hand
  end
  game.next_player
end

game.dealer_play