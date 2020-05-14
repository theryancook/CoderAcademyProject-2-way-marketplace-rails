class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :size
  validates :title, :model, :description, :size_id, :price, :location, :postcode, presence: true
  has_one_attached :picture
end
