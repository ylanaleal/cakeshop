Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Users
  resources :users, only: [] do
    resources :user_addresses, path: 'enderecos', only: [:create, :update, :edit]
    resources :user_payments, path: 'pagamentos', only: [:create, :update, :edit, :destroy]
    # resources :cart_items, only: [:index, :create, :update, :destroy]
  end

  # Lead Events
  resources :lead_events, only: [:new, :create]

  # # Products
  # resources :products do
  #   resources :order_items, only: [:index, :create, :update, :destroy]
  # end

  # Event Products
  resources :event_products, only: [:new, :create, :edit, :update, :destroy]

  # # Product Categories
  # resources :product_categories

  # # Product Inventories
  # resources :product_inventories

  # # Orders
  # resources :orders do
  #   resources :order_items, only: [:index, :create, :update, :destroy]
  #   resources :payments, only: [:create, :update, :destroy]
  # end

  get "up" => "rails/health#show", as: :rails_health_check

end
