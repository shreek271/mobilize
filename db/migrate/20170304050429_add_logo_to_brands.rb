class AddLogoToBrands < ActiveRecord::Migration[5.0]
  def up
    add_attachment :brands, :logo
  end

  def down
    remove_attachment :brands, :logo
  end
end
