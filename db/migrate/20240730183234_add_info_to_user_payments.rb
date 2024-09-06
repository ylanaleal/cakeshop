class AddInfoToUserPayments < ActiveRecord::Migration[7.1]
  def change
    add_reference :user_payments, :user, null: false, foreign_key: true
  end
end
