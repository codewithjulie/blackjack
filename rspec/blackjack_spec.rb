require_relative '../lib/blackjack'

PLAYER1 = Player.new('player1')
PLAYER2 = Player.new('player2')

RSpec.describe Blackjack do
  describe 'instance methods' do
    before do
      @blackjack = Blackjack.new([PLAYER1, PLAYER2])
    end

  end

  describe 'Dealing cards' do
    before do
      @blackjack = Blackjack.new([PLAYER1, PLAYER2])
      @blackjack.deal
    end

    it 'Should return 2 cards for each player' do
      @blackjack.players.each do |player|
        expect(player.hand.cards.count).to eq(2)
      end
    end

    it 'Should return 2 cards for the dealer' do
      expect(@blackjack.dealer.hand.cards.count).to eq(2)
    end

    it 'Should not display the dealers last card' do
      expect(@blackjack.dealer.hand.cards.last.show).to eq(false)
    end

  end
end