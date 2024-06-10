class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update]
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :product_category_id, :product_inventory_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
