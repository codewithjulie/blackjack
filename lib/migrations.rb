require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'codewithjulie',
  database: 'blackjack'
)

class CreatePlayTable < ActiveRecord::Migration
  def change
    create_table :plays do |table|
      table.integer :player_user_id
      table.integer :round_id
      table.integer :bet
      table.integer :hand_value
      table.boolean :blackjack?
      table.timestamps
    end
  end
end

CreatePlayTable.migrate(:down)
CreatePlayTable.migrate(:up)


class CreatePlayerUserTable < ActiveRecord::Migration
  def change
    create_table :player_users do |table|
      table.string :name
    end
  end
end

CreatePlayerUserTable.migrate(:down)
CreatePlayerUserTable.migrate(:up)


class CreateRoundTable < ActiveRecord::Migration

  def change
    create_table :rounds do |table|
      table.integer :dealer_value
      table.timestamps
    end
  end

end
CreateRoundTable.migrate(:down)
CreateRoundTable.migrate(:up)

