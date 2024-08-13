class RemoveInfoFromUserAddresses < ActiveRecord::Migration[7.1]
  def change
    remove_column :user_addresses, :user_references, :string
  end
end
