class RenameColorColumn < ActiveRecord::Migration
  def change
    rename_column :cats, :color, :colour
  end
end
