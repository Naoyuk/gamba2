class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.date :day
      t.string :result
      t.text :caption
      t.references :user, foreign_key: true
      t.references :region, foreign_key: true
      t.references :crag, foreign_key: true
      t.references :area, foreign_key: true
      t.references :route, foreign_key: true

      t.timestamps
    end
  end
end
