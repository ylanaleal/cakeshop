class UserAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_address, only: %i[edit update]

  def new
    @user_address = UserAddress.new
  end

  def create
    @user_address = UserAddress.new(user_address_params)
    @user_address.user = current_user
    if @user_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user_address.update(user_address_params)
    redirect_to root_path
  end

  private

  def user_address_params
    params.require(:user_address).permit(:address_line_1, :address_line_2, :postal_code, :city)
  end

  def set_user_address
    @user_address = UserAddress.find(params[:id])
  end
end
