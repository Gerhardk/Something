class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.integer :game_id
      t.integer :game_ship_id
      t.integer :x
      t.integer :y
      t.string :state
      t.boolean :server_board

      t.timestamps
    end
  end
end
