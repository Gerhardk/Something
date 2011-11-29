class AddServerNukeToNuke < ActiveRecord::Migration
  def change
    add_column :nukes, :server_nuke, :boolean
  end
end
