class Product < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :product_category

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :product_category_id, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "description", "id", "id_value", "name", "price", "product_category_id", "updated_at"]
  end

  def self.ransackable_associations(_auth_object = nil)
    ["product_category"]
  end

  def formatted_price
    number_to_currency(price)
  end
end
