class CreateServerShips < ActiveRecord::Migration[5.0]
  def change
    create_table :server_ships do |t|
      t.string :name
      t.boolean :sunk

      t.timestamps
    end
  end
end
