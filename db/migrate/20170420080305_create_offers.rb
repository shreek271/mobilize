class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.datetime :from_time
      t.datetime :to_time
      t.references :product, index: true, foreign_key: true
      t.timestamps
    end
  end
end
