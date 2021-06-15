require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'codewithjulie',
  database: 'blackjack'
)

class CreateRoundTable < ActiveRecord::Migration[4.2]

  def change
    create_table :rounds do |table|
      table.integer :num_players
      table.timestamps
    end
  end

end
CreateRoundTable.migrate(:down)
CreateRoundTable.migrate(:up)

class CreatePlayTable < ActiveRecord::Migration[4.2]

  def change
    create_table :plays do |table|
      table.integer :player_id
      table.integer :bet
      table.boolean :won?
      table.integer :hand_value
      table.boolean :blackjack?
      table.timestamps
    end
  end

end

CreatePlayTable.migrate(:down)
CreatePlayTable.migrate(:up)

class CreatePlayerTable < ActiveRecord::Migration[4.2]

  def change
    create_table :players do |table|
      table.string :name
    end
  end

end

CreatePlayerTable.migrate(:down)
CreatePlayerTable.migrate(:up)