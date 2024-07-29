ActiveAdmin.register Product do
  permit_params :name, :description, :price, :product_category_id
end
