require_relative '../lib/card'

RSpec.describe Card do

  before do
    suit = 'Hearts'
    rank = '8'
    value = 8

    @card = Card.new(rank, suit, value)
  end

  it 'should respond to suit' do
    expect(@card).to respond_to(:suit)
  end

  it 'should respond to rank' do
    expect(@card).to respond_to(:rank)
  end

  it 'should respond to value' do
    expect(@card).to respond_to(:value)
  end

  it 'should respond to show' do
    expect(@card).to respond_to(:show)
  end

  it 'should return hearts for suit' do
    expect(@card.suit).to eq('Hearts')
  end

  it 'should return 8 for rank' do
    expect(@card.rank).to eq('8')
  end

  it 'should return 8 for value' do
    expect(@card.value).to eq(8)
  end

  it 'should return true for show' do
    expect(@card.show).to eq(true)
  end

  it 'should return the suit and rank of show is true' do
    expect("#{@card}").to eq("#{@card.rank}#{@card.suit}")
  end

  it 'should not return the suit and rank of show is false' do
    @card.show = false
    expect("#{@card}").to eq("?")
  end
end