require "colorize"

class Hand

  attr_accessor :cards, :value

  def initialize()
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def get_value
    sum = @cards.sum {|card| card.value}
    num_aces = @cards.count { |card| card.rank == "A" }
    # sum = @cards.reduce(&:+)
    
    # return sum if sum <= 21
    # look into modulo
    # sum -= ( 1 + num_aces) * 10
    if num_aces > 0 && sum > 21
      sum -= 10
    end

    if num_aces > 1 && sum > 21
      sum -= 10
    end

    if num_aces > 2 && sum > 21
      sum -= 10
    end

    if num_aces > 3 && sum > 21
      sum -= 10
    end

    sum
  end

  def blackjack?
    get_value == 21 && @cards.size == 2
  end

  def bust?
    if get_value > 21
      puts "Bust!".colorize(:red)
      sleep(1)
      return true
    else
      return false
    end
  end
  
end