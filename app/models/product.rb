class Product < ApplicationRecord
  belongs_to :category
  belongs_to :measure
  validates :description, :price, :image_path, :stock_amount, presence: true
end
