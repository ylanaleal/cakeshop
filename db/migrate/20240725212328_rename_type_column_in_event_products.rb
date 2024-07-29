class RenameTypeColumnInEventProducts < ActiveRecord::Migration[7.1]
  def change
    rename_column :event_products, :type, :event_product_type
  end
end
