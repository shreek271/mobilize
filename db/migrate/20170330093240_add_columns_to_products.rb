class AddColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :general, :string
  	add_column :products, :display, :string
  	add_column :products, :software, :string
  	add_column :products, :camera, :string
  	add_column :products, :connectivity, :string
  	add_column :products, :memory, :string
  	add_column :products, :battery, :string
  	add_column :products, :dimensions, :string
  end
end
