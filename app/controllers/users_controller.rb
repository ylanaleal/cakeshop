class UsersController < ApplicationController
  before_action :authenticate_user
  def show
    @products = Product.all
    
  end
end
