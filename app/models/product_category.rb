class ProductCategory < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "description", "id", "id_value", "name", "updated_at"]
  end

  def self.ransackable_associations(_auth_object = nil)
    ["products"]
  end
end
