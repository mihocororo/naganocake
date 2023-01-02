class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item_id, :order_id, :amount, :price, presence: true

enum pay_method:{"クレジットカード":0, "銀行振込":1}
end
