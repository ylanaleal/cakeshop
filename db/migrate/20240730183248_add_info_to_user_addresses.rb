class AddInfoToUserAddresses < ActiveRecord::Migration[7.1]
  def change
    add_reference :user_addresses, :user, null: false, foreign_key: true
  end
end
