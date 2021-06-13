require_relative '../lib/deck'

RSpec.describe Deck do

  before do
    @deck = Deck.new
  end

  it 'should respond to deck' do
    expect(@deck).to respond_to(:deck)
  end

  it 'should respond to shuffle' do
    expect(@deck).to respond_to(:shuffle)
  end

  it 'should respond to deal card' do
    expect(@deck).to respond_to(:deal_card)
  end

  it 'deals last card and removes from the deck' do
    dealt_card = @deck.deck.last
    expect(@deck.deal_card).to eq(dealt_card)
  end

  it 'should respond to create deck' do
    expect(@deck).to respond_to(:create_deck)
  end

  it 'should have 52 cards after creating deck' do
    expect(@deck.deck.size).to eq(52)
  end

  it 'should shuffle cards after calling #shuffle' do
    deck2 = @deck.deck.dup
    @deck.shuffle
    expect(@deck.deck).not_to eq(deck2)
  end

end