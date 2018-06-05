class RenameTypeColumnToRoutes < ActiveRecord::Migration[5.2]
  def change
    rename_column :routes, :type, :style
  end
end
