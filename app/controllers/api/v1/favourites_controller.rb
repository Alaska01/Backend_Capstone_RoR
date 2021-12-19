module Api
    module V1
        class FavouritesController < ApplicationController
            # before_action :authorized
        
            # GET /Favourites
            def index
            @favourites = Favourite.all
        
            render json: @favourites, only: [:id, :user_id]
            end
        
            # GET /Favourites/1
            def show
            render json: @favourite
            end
        
            # POST /Favourites
            def create
            @favourite = Favourite.new(favourite_params)
        
            if @favourite.save
                render json: @favourite, status: :created
            else
                render json: @favourite.errors, status: :unprocessable_entity
            end
            end
        
            # # PATCH/PUT /Favourites/1
            # def update
            #   if @Favourite.update(Favourite_params)
            #     render json: @Favourite
            #   else
            #     render json: @Favourite.errors, status: :unprocessable_entity
            #   end
            # end
        
            # # DELETE /Favourites/1
            # def destroy
            #   @Favourite.destroy
            # end
        
            private
            # Use callbacks to share common setup or constraints between actions.
            def set_Favourite
                @Favourite = Favourite.find(params[:id])
            end
        
            #   # Only allow a list of trusted parameters through.
            def favourite_params
                params.require(:favourite).permit(:favourite_name, :password)
            end
    end
  end
end