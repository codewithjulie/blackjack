require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'codewithjulie',
  database: 'blackjack'
)

class Play < ActiveRecord::Base
  belongs_to :player_user
  belongs_to :round
end

class Round < ActiveRecord::Base
  has_many :player_users
  has_many :plays
end

class PlayerUser < ActiveRecord::Base
  has_many :rounds
  has_many :plays
end