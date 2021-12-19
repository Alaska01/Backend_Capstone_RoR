module Api
    module V1
        class UsersController < ApplicationController
            before_action :authorized, only: [:auto_login]
  
            # GET /users
            def index
            @users = User.all
        
            render json: @users, only: [:id, :username, :password, :password_confirmation]
            end
        
            # GET /users/1
            def show
            # @user = User.find(params[:id])
            set_user
            render json: @user, only: [:id, :username]
            end
        
        
        #  ***************************************
        
        # REGISTER POST /users
        def create
            @user = User.create(user_params)
            if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
            else
            render json: {error: "Invalid username or password"}
            end
        end
        
        # LOGGING IN
        def login
            @user = User.find_by(username: user_params[:username])
        
            if @user && @user.authenticate(user_params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
            else
            render json: {error: "Invalid username or password"}
            end
        end
  
        def auto_login
            render json: @user
        end
  
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:username, :password, :password_confirmation) 
      end
  end
  
  end
  end