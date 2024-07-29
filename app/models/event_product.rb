class EventProduct < ApplicationRecord
  has_many :lead_events

  validates :name, presence: true
  validates :event_product_type, presence: true

  def self.ransackable_associations(_auth_object = nil)
    ["lead_events"]
  end

  def self.ransackable_attributes(_auth_object = nil)
    ["created_at", "event_product_type", "id", "id_value", "name", "updated_at"]
  end
end
