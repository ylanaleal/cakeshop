class RemoveInfoFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_reference :products, :product_inventory, null: false, foreign_key: true
  end
end
