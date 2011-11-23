class AddServerGameIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :server_game_id, :integer
  end
end
