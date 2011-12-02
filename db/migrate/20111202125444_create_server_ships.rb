class CreateServerShips < ActiveRecord::Migration
  def change
    create_table :server_ships do |t|
      t.string :name
      t.boolean :sunk

      t.timestamps
    end
  end
end
