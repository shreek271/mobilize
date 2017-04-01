class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.belongs_to  :product
      t.attachment  :picture
      t.timestamps
    end
  end
end
