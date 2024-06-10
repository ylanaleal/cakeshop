class CreateLeadEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :lead_events do |t|
      t.string :event_type
      t.date :event_date
      t.integer :guest_number
      t.string :theme
      t.references :event_product, null: false, foreign_key: true
      t.integer :product_quantity
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
