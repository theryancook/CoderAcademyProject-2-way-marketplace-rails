class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :size
  # validates :title, :model, :description, :size, :price, :location, :postcode, :availability, presence: true #didnt include picture
  has_one_attached :picture
end
