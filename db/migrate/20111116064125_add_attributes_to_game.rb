class AddAttributesToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :server_hits, :integer
    add_column :games, :client_hits, :integer
  end
end
