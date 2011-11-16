class AddAttributesToGame < ActiveRecord::Migration
  def change
    add_column :games, :server_hits, :integer
    add_column :games, :client_hits, :integer
  end
end
