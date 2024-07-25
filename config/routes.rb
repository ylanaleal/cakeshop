Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Users
  resources :users, only: [] do
    resources :user_addresses, path: 'enderecos', only: %i[new create update edit]
    resources :user_payments, path: 'pagamentos', only: %i[new create update edit destroy]
    resources :cart_items, only: %i[index new create edit update destroy]
  end

  # Lead Events
  resources :lead_events, only: %i[new create]

  # Products
  resources :products, except: %i[index]
  # do
  #   resources :order_items, only: [:index, :create, :update, :destroy]
  # end

  # Event Products
  resources :event_products, only: %i[new create edit update destroy]

  # Product Categories
  resources :product_categories, only: %i[new create edit update destroy]

  # Product Inventories
  resources :product_inventories, only: %i[new create edit update]

  # Orders
  resources :orders do
    resources :order_items, only: %i[index new create]
    resources :payments, only: %i[new create edit update destroy]
  end

  get "/profile", to: "users#show", as: :user_profile
  get "up" => "rails/health#show", as: :rails_health_check
end
