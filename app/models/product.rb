class Product < ApplicationRecord
  
  belongs_to :brand
  belongs_to :type
  has_many :images, :dependent => :destroy
  has_many :orders, :dependent => :nullify
  #accepts_nested_attributes_for :images, :allow_destroy => true
  attr_accessor :picture
end
