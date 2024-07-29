class LeadEvent < ApplicationRecord
  belongs_to :event_product
  belongs_to :user, optional: true

  validates :event_type, presence: true
  validates :event_date, presence: true
  validates :guest_number, presence: true
  validates :theme, presence: true
  validates :event_product_id, presence: true
  validates :product_quantity, presence: true
  validates :full_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "email", "event_date", "event_product_id", "event_type", "full_name", "guest_number", "id", "id_value", "phone", "product_quantity", "theme", "updated_at", "user_id"]
  end

  def self.ransackable_associations(_auth_object = nil)
    ["event_product", "user"]
  end

  def formatted_event_date
    event_date.strftime("%B %d, %Y")
  end
end
