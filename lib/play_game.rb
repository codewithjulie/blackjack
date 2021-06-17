require_relative "deck"
require_relative "player"
require_relative "blackjack"
require_relative "associations.rb"


system("clear")

puts "Welcome to my Blackjack game"
puts "For now, all players you enter will have 100 chips"
puts "The dealer is played by the computer"
puts "Enter number of players up to 5"

print "How many players?"
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
  round = Round.create(dealer_value: game.dealer.hand.get_value)
  players.each do |player|
    playerdb = PlayerUser.create(name: player.name)
    Play.create(player_id: playerdb, bet: player.bet, hand_value: player.hand.get_value, round_id: round.id)
  end
  players.each {|player| }
  game = Blackjack.new(players)
end