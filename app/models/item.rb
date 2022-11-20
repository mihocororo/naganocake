class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  # attachment :image

  # varidates :text, presence: true
  # varidates :status, inclusion: { in:[true,1]}
  # validates checked, inclusion: [ture,1]
end
