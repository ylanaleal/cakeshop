class OrdersController < ApplicationController
  before_action :set_order, only: %i[edit update destroy]
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.user = current_user
    if order.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if order.update(order_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:total)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
