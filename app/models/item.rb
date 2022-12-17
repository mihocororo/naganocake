class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  has_many :cart_items
  has_many :orders
  has_many :order_items
  validates :name, presence: true
  # varidates :text, presence: true
  # varidates :status, inclusion: { in:[true,1]}
  # validates checked, inclusion: [ture,1]
end
