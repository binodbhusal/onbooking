module Host
  class PropertiesController < ApplicationController
    before_action :authenticate_user!
    def new
      authorize current_user, policy_class: HostPolicy
      @property = Property.new
    end

    def create
      authorize current_user, policy_class: HostPolicy
      @property = current_user.properties.new(property_params)
      price_in_euro = params[:property][:price_cents].to_f
      @property.price_cents = Money.from_amount(price_in_euro, 'EUR').cents
      if @property.save
        redirect_to host_dashboard_path
      else
        render :new
      end
    end

    private

    def property_params
      params.require(:property).permit(:name, :headline, :price_cents, :description, :city, :state,
                                       :address1, :address2, :zip_code, :country_code, :images)
    end
  end
end
