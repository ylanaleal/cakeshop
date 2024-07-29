class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :product_inventory
  has_one_attached :photo
end
