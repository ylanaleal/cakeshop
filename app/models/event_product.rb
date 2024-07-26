class EventProduct < ApplicationRecord
  has_many :lead_events

  validates :name, presence: true
  validates :event_product_type, presence: true
end
