class RenameServerNukeInNuke < ActiveRecord::Migration[5.0]
  def change
    rename_column :nukes, :server_nuke, :server_nuke_boolean
  end
end
