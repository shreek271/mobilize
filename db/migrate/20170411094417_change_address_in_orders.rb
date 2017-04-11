class ChangeAddressInOrders < ActiveRecord::Migration[5.0]
  def change
  	rename_column :orders, :address, :line_one
  	add_column :orders, :pin_code, :integer
  	add_column :orders, :landmark, :string
  	add_column :orders, :area, :string
  end
end
