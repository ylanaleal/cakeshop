class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @products = Product&.all
    @event_products = EventProduct&.all
  end
end
