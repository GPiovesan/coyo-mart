class CreateMeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :measures do |t|
      t.string :measure

      t.timestamps
    end
  end
end
