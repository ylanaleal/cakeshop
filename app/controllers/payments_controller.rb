class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[edit update destroy]
  before_action :authenticate_user!

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    payment = Payment.new(payment_params)
    payment.user = current_user
    if payment.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if payment.update(payment_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @payment.destroy
    redirect_to root_path
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :provider)
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end
end
