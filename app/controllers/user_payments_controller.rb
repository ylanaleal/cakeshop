class UserPaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_payment, only: %i[edit update]

  def new
    @payment = UserPayment.new
  end

  def create
    @user_payment = UserPayment.new(user_payment_params)
    @user_payment.user = current_user
    if @user_payment.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user_payment.update(user_payment_params)
    redirect_to root_path
  end

  def destroy
    @user_payment.destroy
    redirect_to root_path
  end

  private

  def user_payment_params
    params.require(:user_payment).permit(:payment_type, :provider, :account_no)
  end

  def set_user_payment
    @user_payment = UserPayment.find(params[:id])
  end
end
