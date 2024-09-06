class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @orders = Order&.where(user_id: current_user.id)&.order(created_at: :desc)
    @addresses = UserAddress&.where(user_id: current_user.id)
    @payments = UserPayment&.where(user_id: current_user.id)
  end
end
