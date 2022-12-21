class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
enum pay_method:{"クレジットカード":0, "銀行振込":1}
end
