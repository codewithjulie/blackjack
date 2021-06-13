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
    # sum = @cards.reduce(&:+)
    if @cards.any?{|card| card.rank == "A"} && sum > 21
      sum -= 10
    end
    sum
  end

  def blackjack?(player)
    if get_value == 21
      if @cards.size == 2
        puts "#{player} got Blackjack!".colorize(:green)
      elsif @cards.size > 2
        puts "#{player} got twenty-one!".colorize(:green)
      end
      player.in_game = false
      return true
    end
    false
  end

  def bust?(player)
    if get_value > 21
      puts "#{player} busted".colorize(:red)
      player.in_game = false
      return true
    end
    false
  end
  
end