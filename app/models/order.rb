class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
  STATUS = { recieved: 1, processing: 2, delivered: 3, cancelled: 4}
 
  validates :area, presence: true
  validates :line_one, presence: true
  validates :pin_code, presence: true, length: { maximum: 6, minimum: 6 }
  validates :landmark, presence: true
  validates :mobile_no, presence: true, length: { maximum: 10, minimum: 10 }
  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 1


  default_scope -> { order(created_at: :desc) }
end
