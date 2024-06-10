class CreateUserAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :user_addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :postal_code
      t.string :user_references

      t.timestamps
    end
  end
end
