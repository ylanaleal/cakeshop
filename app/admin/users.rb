ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :phone,:admin

  index do
    selectable_column
    column :id
    column :email
    column :phone
    column :full_name
    column :created_at
    column :admin
    actions
  end
end
