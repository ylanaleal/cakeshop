Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Users
  resources :users, only: [] do
    resources :user_addresses, path: 'enderecos', only: [:new, :create, :update, :edit]
    resources :user_payments, path: 'pagamentos', only: [:new, :create, :update, :edit, :destroy]
    resources :cart_items, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  # Lead Events
  resources :lead_events, only: [:new, :create]

  # Products
  resources :products, except: [:index]
  # do
  #   resources :order_items, only: [:index, :create, :update, :destroy]
  # end

  # Event Products
  resources :event_products, only: [:new, :create, :edit, :update, :destroy]

  # Product Categories
  resources :product_categories, only: [:new, :create, :edit, :update, :destroy]

  # Product Inventories
  resources :product_inventories, only: [:new, :create, :edit, :update]

  # Orders
  resources :orders do
    resources :order_items, only: [:index, :new, :create]
    resources :payments, only: [:new, :create, :edit, :update, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
