class RemoveFavsCountToFavs < ActiveRecord::Migration[5.2]
  def change
    remove_column :favs, :favs_count, :integer
  end
end
