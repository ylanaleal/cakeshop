class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: %i[edit update destroy]
  before_action :authenticate_user!

  def new
    @product_category = ProductCategory.new
  end

  def create
    @product_category = ProductCategory.new(product_category_params)
    if @product_category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_category.update(product_category_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product_category.destroy
    redirect_to root_path
  end

  private

  def product_category_params
    params.require(:product_category).permit(:name)
  end

  def set_product_category
    @product_category = ProductCategory.find(params[:id])
  end
end
