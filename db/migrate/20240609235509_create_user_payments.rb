class CreateUserPayments < ActiveRecord::Migration[7.1]
  def change
    create_table :user_payments do |t|
      t.string :payment_type
      t.string :provider
      t.integer :account_no
      t.string :user_references

      t.timestamps
    end
  end
end
