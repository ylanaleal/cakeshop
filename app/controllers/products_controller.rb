class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy]
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if params[:confirm_and_new].present? && @product.save!
        format.html { redirect_to new_product_path, notice: 'Produto criado com sucesso' }
      elsif @product.save!
        format.html { redirect_to user_profile_path, notice: 'Produto criado com sucesso.' }
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to user_profile_path, notice: 'Produto atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to user_profile_path, notice: 'Produto deletado com sucesso.'
    else
      redirect_to request.referer, notice: 'Não foi possível deletar o produto.'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :product_category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
