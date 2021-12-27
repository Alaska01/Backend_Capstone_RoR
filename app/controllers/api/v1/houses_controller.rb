module Api
    module V1
  class HousesController < ApplicationController
    # before_action :authorized, only: [:create, :destroy, :update]
  
    # GET /houses
    def index
      @houses = House.all
  
      render json: @houses, only: [:id, :username, :house_name, :house_description, :images]
    end
  
    # GET /houses/1
    def show
        set_house
      render json: @house, except: [:created_at, :updated_at] 
    end
  
    
  end
  
  end
  end