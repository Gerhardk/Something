class CreateNukes < ActiveRecord::Migration
  def change
    create_table :nukes do |t|
      t.string :x
      t.string :y
      t.integer :game_id
      t.string :status
      t.timestamps
    end
  end
end
