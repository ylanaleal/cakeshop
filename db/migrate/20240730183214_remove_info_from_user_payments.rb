class RemoveInfoFromUserPayments < ActiveRecord::Migration[7.1]
  def change
    remove_column :user_payments, :user_references, :string
  end
end
