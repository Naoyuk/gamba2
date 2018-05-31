class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :grade
      t.integer :type
      t.integer :rate
      t.references :region, foreign_key: true
      t.references :crag, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
