class EventProductsController < ApplicationController
  before_action :set_event_product, only: [:edit, :update, :destroy]

  def new
    @event_product = EventProduct.new
  end

  def create
    @event_product = EventProduct.new(event_product_params)

    respond_to do |format|
      if params[:confirm_and_new].present? && @event_product.save!
        format.html { redirect_to new_event_product_path, notice: 'Produto criado com sucesso' }
      elsif @event_product.save!
        format.html { redirect_to user_profile_path, notice: 'Produto criado com sucesso.' }
      else
        render :new
      end
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
    redirect_to user_profile_path
  end

  private

  def event_product_params
    params.require(:event_product).permit(:name, :event_product_type)
  end

  def set_event_product
    @event_product = EventProduct.find(params[:id])
  end
end
