class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :description
      t.decimal :price
      t.string :image_path
      t.integer :stock_amount
      t.boolean :featured
      t.references :category, null: false, foreign_key: true
      t.references :measure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
