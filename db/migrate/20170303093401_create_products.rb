class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.integer :price
      t.integer :quantity
      t.string :color
      t.references :brand, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true
      t.timestamps
    end
  end
end
