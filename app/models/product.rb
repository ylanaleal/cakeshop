class Product < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :product_category

  def formatted_price
    number_to_currency(price)
  end
end
