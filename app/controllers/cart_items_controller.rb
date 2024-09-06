class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[destroy edit update]
  before_action :authenticate_user!

  def index
    @cart_items = current_user.cart_items.includes(:product)
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    cart_item = current_user.cart_items.find_or_initialize_by(product_id: cart_item_params[:product_id])
    cart_item.quantity = (cart_item.quantity || 0) + cart_item_params[:quantity].to_i

    if cart_item.save
      redirect_to user_cart_items_path(current_user), notice: 'Produto adicionado ao carrinho com sucesso.'
    else
      redirect_to product_path(cart_item_params[:product_id]), alert: 'Falha ao adicionar produto ao carrinho.'
    end
  end

  def edit
  end

  def update
    if cart_item.update(cart_item_params)
      redirect_to user_cart_items_path(current_user), notice: 'Carrinho atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @cart_item = current_user.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to user_cart_items_path(current_user), notice: 'Produto removido do carrinho.'
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

  def set_cart_item
    @cart_item = current_user.cart_items.find(params[:id])
  end
end
