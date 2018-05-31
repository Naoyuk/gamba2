class RenameRockToCrag < ActiveRecord::Migration[5.2]
  def change
    rename_table :rocks, :crags
  end
end
