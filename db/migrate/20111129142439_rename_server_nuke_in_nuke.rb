class RenameServerNukeInNuke < ActiveRecord::Migration
  def change
    rename_column :nukes, :server_nuke, :server_nuke_boolean
  end
end
