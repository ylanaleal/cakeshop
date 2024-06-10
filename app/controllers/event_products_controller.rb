class EventProductsController < ApplicationController
  before_action :set_event_product, only: [:edit, :update, :destroy]

  def new
    @event_product = EventProduct.new
  end

  def create
    @event_product = EventProduct.new(event_product_params)
    if @event_product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event_product.update(event_product_params)
    redirect_to root_path
  end

  def destroy
    @event_product.destroy
    redirect_to root_path
  end

  private

  def event_product_params
    params.require(:event_product).permit(:name, :type)
  end

  def set_event_product
    @event_product = EventProduct.find(params[:id])
  end

end
