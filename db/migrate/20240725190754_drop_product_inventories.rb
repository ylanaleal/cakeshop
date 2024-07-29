class DropProductInventories < ActiveRecord::Migration[7.1]
  def change
    drop_table :product_inventories
  end
end
