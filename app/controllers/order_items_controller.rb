class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def show
    @order_item = OrderItem.find(params[:id])
  end

  def new
    @order_item = OrderItem.new
  end

  def create
    order_item = OrderItem.new(order_item_params)
    order_item.user = current_user
    if order_item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
