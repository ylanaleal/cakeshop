class ProductCategory < ApplicationRecord
  belongs_to :user, optional: true
end
