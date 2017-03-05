class Type < ApplicationRecord

  has_many :products
  has_many :brands, through: :products
  
end
