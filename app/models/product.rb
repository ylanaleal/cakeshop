class Product < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :product_category

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :product_category_id, presence: true

  def formatted_price
    number_to_currency(price)
  end
end
