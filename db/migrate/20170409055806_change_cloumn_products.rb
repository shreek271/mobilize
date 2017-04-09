class ChangeCloumnProducts < ActiveRecord::Migration[5.0]
  def change
  	rename_column :products, :model, :discount
  	change_column :products, :discount, :integer
  	add_column    :products, :highlight, :string
  	change_column :products, :general, :text
  	change_column :products, :display, :text
  	change_column :products, :software, :text
  	change_column :products, :camera, :text
  	change_column :products, :connectivity, :text
  	change_column :products, :memory, :text
  end
end
