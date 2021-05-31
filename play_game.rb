require_relative "deck"
require_relative "player"
require_relative "blackjack"


system("clear")

bob = Player.new("Bob")
mary = Player.new("Mary")

game = BlackJack.new([bob, mary])

until game.game_over?
  system("clear")
  game.deal
  game.place_bets

  system("clear")
  game.display_all_players_cards

  game.check_all_players_for_natural_blackjack

  while game.current_player && !game.round_over?
    game.player_play
    game.display_all_players_cards
    game.next_player
  end

  unless game.round_over?
    game.dealer_play
    game.display_all_players_cards
    game.prompt_any_key
    game = BlackJack.new([bob, mary])
    game.start
  end
end



=begin

1. deal cards
2. show all casrds
2. if dealer has natural blackjack, take all chips, but if another player has natural black jack - then they tie and no chips taken
3. if any player has natural blackjack, they get 1.5 num of chips, and they end their play
4. Remaining players - each will take their turn
5. dealer then plays
6. 




=end