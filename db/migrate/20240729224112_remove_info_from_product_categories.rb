class RemoveInfoFromProductCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :product_categories, :description, :string
  end
end
