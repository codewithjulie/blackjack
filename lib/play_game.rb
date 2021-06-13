require_relative "deck"
require_relative "player"
require_relative "blackjack"


system("clear")

print "How many players? "
num_players = gets.chomp.to_i

players = []

num_players.times do 
  print "Enter name of player: "
  players << Player.new(gets.chomp)
end

game = Blackjack.new(players)

until game.game_over?
  game.play_round
  game = Blackjack.new(players)
end

