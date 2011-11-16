class AddAttributesToShip < ActiveRecord::Migration
  def change
    add_column :ships, :max_per_game, :integer
  end
end
