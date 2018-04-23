class AddServerNukeToNuke < ActiveRecord::Migration[5.0]
  def change
    add_column :nukes, :server_nuke, :boolean
  end
end
