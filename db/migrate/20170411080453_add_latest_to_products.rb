class AddLatestToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :latest, :boolean, default: 0
  end
end
