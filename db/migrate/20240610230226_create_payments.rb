class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :provider
      t.boolean :status

      t.timestamps
    end
  end
end
