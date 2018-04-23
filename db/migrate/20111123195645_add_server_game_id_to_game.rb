class AddServerGameIdToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :server_game_id, :integer
  end
end
