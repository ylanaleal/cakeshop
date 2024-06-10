class ProductInventoriesController < ApplicationController
  before_action :set_inventory, only: %i[edit update]
  before_action :authenticate_user!

  def new
    @product_inventory = ProductInventory.new
  end

  def create
    product_inventory = ProductInventory.new(product_inventory_params)
    if product_inventory.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if product_inventory.update(product_inventory_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def product_inventory_params
    params.require(:product_inventory).permit(:product_id, :quantity)
  end

  def set_inventory
    @product_inventory = ProductInventory.find(params[:id])
  end
end
