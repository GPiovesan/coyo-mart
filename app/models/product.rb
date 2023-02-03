class Product < ApplicationRecord
  belongs_to :category
  belongs_to :measure
  validates :description, presence: true
end
