module Properties
  class ReservationsController < ApplicationController
    before_action :authenticate_user!
    def new
      @property = Property.find(params[:property_id])
      @reservation = @property.reservations.new
      @checkin_date = new_reservation_params[:checkin_date]
      @checkout_date = new_reservation_params[:checkout_date]
      @nights = calculate_nights(@checkin_date, @checkout_date)
      @sub_total = new_reservation_params[:sub_total]
      @weekly_discount = new_reservation_params[:weekly_discount]
      @service_fee = new_reservation_params[:service_fee]
      @cleaning_fee = new_reservation_params[:cleaning_fee]
      @total = new_reservation_params[:total]
    end

    private

    def new_reservation_params
      params.permit(:checkin_date, :checkout_date, :sub_total, :weekly_discount, :service_fee, :cleaning_fee,
                    :total)
    end

    def calculate_nights(checkin_date, checkout_date)
      Date.strptime(checkout_date,
                    Date::DATE_FORMATS[:utc_short_date]).mjd - Date.strptime(checkin_date,
                                                                             Date::DATE_FORMATS[:utc_short_date]).mjd
    end
  end
end
