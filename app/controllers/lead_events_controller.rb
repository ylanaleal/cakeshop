class LeadEventsController < ApplicationController
  def new
    @lead_event = LeadEvent.new
  end

  def create
    @lead_event = LeadEvent.new(lead_event_params)
    @lead_event.user = current_user if current_user

    if @lead_event.save
      redirect_to root_path, notice: "Obrigado por se inscrever!"
    else
      render :new
    end
  end

  private

  def lead_event_params
    params.require(:lead_event).permit(:event_type, :event_date, :guest_number, :theme, :product_quantity, :full_name, :email, :phone, :event_product_id)
  end
end
