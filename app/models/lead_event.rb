class LeadEvent < ApplicationRecord
  belongs_to :event_product
  belongs_to :user
end
