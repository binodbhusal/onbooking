module Api
  class FavroutesController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token, only: %i[create destroy]

    def create
      favroute = Favroute.create(favroute_params)
      respond_to do |format|
        format.json do
          render json: serialize_favroute(favroute), status: :created
        end
      end
    end

    def destroy
      favroute = Favroute.find(params[:id])
      favroute.destroy!
      respond_to do |format|
        format.json do
          render json: serialize_favroute(favroute), status: 204
        end
      end
    end

    private

    def favroute_params
      params.require(:favroute).permit(:user_id, :property_id)
    end

    def serialize_favroute(favroute)
      FavrouteSerializer.new(favroute).serializable_hash[:data].to_json
    end
  end
end
