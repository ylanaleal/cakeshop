class LeadEvent < ApplicationRecord
  has_one :event_product
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
end
