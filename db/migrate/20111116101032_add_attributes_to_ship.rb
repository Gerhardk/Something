class AddAttributesToShip < ActiveRecord::Migration[5.0]
  def change
    add_column :ships, :max_per_game, :integer
  end
end
