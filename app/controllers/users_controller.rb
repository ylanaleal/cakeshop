class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @products = Product&.all
    @event_products = EventProduct&.all
    @orders = Order&.where(user_id: current_user.id)&.order(created_at: :desc)
  end
end
