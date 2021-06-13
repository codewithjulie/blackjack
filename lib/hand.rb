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
    # if get_value == 21
    #   if @cards.size == 2
    #     puts "#{player} got Blackjack!".colorize(:green)
    #   elsif @cards.size > 2
    #     puts "#{player} got twenty-one!".colorize(:green)
    #   end
    #   return true
    # end
    # false
  end

  def bust?
    get_value > 21
    # if get_value > 21
    #   puts "#{player} busted".colorize(:red)
    #   player.in_game = false
    #   return true
    # end
    # false
  end
  
end