require_relative "deck"
require_relative "player"
require_relative "blackjack"


system("clear")

print "How many players up to 5?"
num_players = gets.chomp.to_i

if num_players > 5
  num_players == 5
end

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

