class AddAttributesToServerShip < ActiveRecord::Migration
  def change
    add_column :server_ships, :game_id, :integer
  end
end
