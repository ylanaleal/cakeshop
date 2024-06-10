class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[edit update]
  before_action :authenticate_user!

  def show
    @cart_item = CartItem.find(params[:id])
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.user = current_user
    if cart_item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if cart_item.update(cart_item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to root_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
