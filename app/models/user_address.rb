class UserAddress < ApplicationRecord
  belongs_to :user

  validates :address_line_1, presence: true
  validates :address_line_2, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true

  def full_address
    "#{address_line_1}, #{address_line_2}, #{city} #{postal_code}"
  end
end
