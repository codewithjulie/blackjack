require 'active_record'
require_relative 'associations.rb'

class GameRecord

  def self.all_rounds

    Round.all

  end

end

puts GameRecord.all_rounds