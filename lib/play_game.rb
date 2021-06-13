require_relative "deck"
require_relative "player"
require_relative "blackjack"


system("clear")

bob = Player.new("Bob")
mary = Player.new("Mary")

game = Blackjack.new([bob, mary])

until game.game_over?
  system("clear")
  game.play_round
  game.display_all_players_cards
  game = Blackjack.new([bob, mary])
end