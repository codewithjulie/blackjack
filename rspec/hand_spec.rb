require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Hand do

  before do
    @hand = Hand.new
  end

  it 'responds to cards' do
    expect(@hand).to respond_to(:cards)
  end

  describe '#add_card' do

    it 'responds to add_card' do
      expect(@hand).to respond_to(:add_card)
    end

    it 'should return the correct properties of cards added' do
      card1 = Card.new("K", "Hearts", 10)
      card2 = Card.new("5", "Clubs", 5)

      @hand.add_card(card1)
      @hand.add_card(card2)

      expect(@hand.cards.size).to eq(2)
      expect(@hand.cards.first.suit).to eq("Hearts")
      expect(@hand.cards.first.rank).to eq("K")
      expect(@hand.cards.first.value).to eq(10)
      expect(@hand.cards.last.suit).to eq("Clubs")
      expect(@hand.cards.last.rank).to eq("5")
      expect(@hand.cards.last.value).to eq(5)
    end
  end


  describe '#get_value' do
    it 'responds to get_value' do
      expect(@hand).to respond_to(:get_value)
    end

    it 'returns correct value with no ace' do
      card1 = Card.new("K", "Hearts", 10)
      card2 = Card.new("5", "Clubs", 5)

      @hand.add_card(card1)
      @hand.add_card(card2)

      expect(@hand.get_value).to eq(15)
    end

    it 'returns correct value with ace and jack' do
      card1 = Card.new("J", "Hearts", 10)
      card2 = Card.new("5", "Clubs", 5)
      card3 = Card.new("A", "Clubs", 11)

      @hand.add_card(card1)
      @hand.add_card(card2)
      @hand.add_card(card3)

      expect(@hand.get_value).to eq(16)
    end

  end

  describe 'hand output' do

    it 'returns the correct output if show is true for all cards' do
      
    end

    it 'returns the correct output if show is false for one card' do

    end
  end

end