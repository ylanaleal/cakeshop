class Product < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  has_one :product_category

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true

  def formatted_price
    number_to_currency(price)
  end
end
