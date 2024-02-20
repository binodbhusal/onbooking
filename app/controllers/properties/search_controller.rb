module Properties
  class SearchController < ApplicationController
    def index
      @properties = Property.all
      @properties = @properties.city(search_params[:city]) if search_params[:city].present?
      @properties = @properties.country_code(search_params[:country_code]) if search_params[:country_code].present?
      properties_without_reservations = @properties.includes(:reservations).select do |property|
        property.reservations.empty?
      end
      if search_params[:checkin_date] && search_params[:checkout_date]
        @properties = @properties.between_dates(search_params[:checkin_date], search_params[:checkout_date])
      end
      @properties = Property.where(id: properties_without_reservations.map(&:id) + @properties.ids)
    end

    private

    def search_params
      params.permit(:city, :country_code, :checkin_date, :checkout_date)
    end
  end
end
