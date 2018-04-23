class AddAttributesToServerShip < ActiveRecord::Migration[5.0]
  def change
    add_column :server_ships, :game_id, :integer
  end
end
