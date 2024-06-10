class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.references :product_category, null: false, foreign_key: true
      t.references :product_inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
