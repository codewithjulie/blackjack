require_relative "hand"

class Player

  attr_accessor :hand, :name, :dealer, :in_game

  def initialize(name)
    @name = name
    @hand = Hand.new
    @chips = 100
    @in_game = true
  end

  def to_s
    @name
  end

  def get_play
    play = prompt_play
    until valid_play?(play)
      puts "I did not understand that input"
      play = prompt_play
    end
    play
  end

  def valid_play?(play)
    play == "stand" || play == "hit"
  end

  def prompt_play
    print "#{@name} would you like to stand or hit? "
    play = gets.chomp.downcase
  end

end