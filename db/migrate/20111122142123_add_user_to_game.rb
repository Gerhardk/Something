class AddUserToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :email, :string
    add_column :games, :name, :string
  end
end
