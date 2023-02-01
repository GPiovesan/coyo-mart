class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :description
      t.decimal :price
      t.string :image_path
      t.belongs_to :categories

      t.timestamps
    end
  end
end
