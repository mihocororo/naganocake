class Order < ApplicationRecord
  has_many :customers
  enum pay_method:{"クレジットカード":0, "銀行振込":1}
end
