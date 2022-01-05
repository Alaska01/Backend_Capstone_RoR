module Api
  module V1
    class HousesController < ApplicationController
      def index
        @houses = House.all
        render json: HousesSerializer.new(@houses).as_json
      end

      # GET /houses/1
      def show
        house = House.find(params[:id])
        if house
          render json: HouseSerializer.new(house).as_json, status: :ok
        else
          render status: :unprocessable_entity
        end
      end
    end
  end
end
