class CreateGameShips < ActiveRecord::Migration
  def change
    create_table :game_ships do |t|
      t.integer :game_id
      t.integer :ship_id
      t.boolean :sunk
      t.integer :hit_count
      t.string :orientation
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
