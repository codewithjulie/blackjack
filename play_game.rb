require_relative "deck"
require_relative "player"
require_relative "blackjack"


game = BlackJack.new([Player.new("Bob"), Player.new("Mary")])

game.deal

game.players.each do |player|
  puts "#{player} #{player.display_hand}"
end

puts game.current_player.dealer

until game.current_player.dealer
  game.get_player_play

  game.players.each do |player|
    puts "#{player} #{player.display_hand}"
  end

  game.next_player
end