class Product < ApplicationRecord
  belongs_to :category
  belongs_to :measure
  # Active Storage
  has_one_attached :image
  validates :description, :price, :image, :stock_amount, presence: true
end
