require_relative "deck"
require_relative "player"
require_relative "blackjack"


game = BlackJack.new([Player.new("Bob", true), Player.new("Mary")])

puts game.players

game.deal

puts game.players

puts game.deck.cards.size