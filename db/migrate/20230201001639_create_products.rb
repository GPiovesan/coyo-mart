class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :description
      t.decimal :price
      t.string :image_path
      t.integer :in_stock
      t.boolean :featured
      t.belongs_to :categories
      t.belongs_to :measures
      t.timestamps
    end
  end
end
