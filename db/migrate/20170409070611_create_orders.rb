class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.integer :quantity
      t.integer :mobile_no
      t.status :integer, default: 1
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
