ActiveAdmin.register Product do
  permit_params :name, :description, :price, :product_category_id, :photo

  # Remover filtros que não são diretamente pesquisáveis no banco de dados
  remove_filter :photo_attachment
  remove_filter :photo_blob

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :product_category
      f.input :photo, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price do |product|
        product.formatted_price
      end
      row :product_category
      row :photo do |product|
        if product.photo.attached?
          image_tag product.photo.url
        else
          "No photo available"
        end
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price do |product|
      product.formatted_price
    end
    column :product_category
    column :photo do |product|
      if product.photo.attached?
        image_tag product.photo.url, size: "100x100"
      else
        "No photo available"
      end
    end
    actions
  end
end
