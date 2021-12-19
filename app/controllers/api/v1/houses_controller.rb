module Api
    module V1
  class HousesController < ApplicationController
    # before_action :set_house, only: [:create, :update, :destroy]
    before_action :authorized, only: [:create, :destroy, :update]
  
    # GET /houses
    def index
      @houses = House.all
  
      render json: @houses, only: [:id, :user_id, :username, :house_name, :house_description]
    end
  
    # GET /houses/1
    def show
        set_house
      render json: @house, except: [:created_at, :updated_at] 
    end
  
    # POST /houses
    def create
      @house = House.new(house_params)
  
      if @house.save
        render json: @house, status: :created
      else
        render json: @house.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /houses/1
    def update
      if @house.update(house_params)
        render json: @house
      else
        render json: @house.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /houses/1
    def destroy
      @house.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_house
        @house = House.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def house_params
        params.require(:house).permit(:house_name, :user_id, :house_description)
      end
  end
  
  end
  end