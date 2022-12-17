class CartItem < ApplicationRecord
  validates :amount, presence:true
  belongs_to :customer
  belongs_to :item
  has_one_attached :image
  validates :amount, numericality: {onle_integer: true}


end
