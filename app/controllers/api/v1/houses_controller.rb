module Api
  module V1
class HousesController < ApplicationController
  # before_action :authorized, only: [:create, :destroy, :update]

  # GET /houses
  def index
    @houses = House.all
    render json: HousesSerializer.new(@houses).as_json

    # render json: @houses, only: [:id, :username, :house_name, :house_description, :images]
  end

  # GET /houses/1
  def show
    # @house = House.find(params[:id])
    # render json: HousesSerializer.new(house).as_json, status: :ok
    # render json: @house, except: [:created_at, :updated_at] 

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