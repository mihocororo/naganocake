class CartItem < ApplicationRecord
  validates :amount, presence:true
  def subtotal
    amount*item.price*1.10
  end

  has_many :orders

  belongs_to :customer
  belongs_to :item
  has_one_attached :image
  validates :amount, numericality: {onle_integer: true}


end
