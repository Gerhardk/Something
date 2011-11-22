class AddUserToGame < ActiveRecord::Migration
  def change
    add_column :games, :email, :string
    add_column :games, :name, :string
  end
end
