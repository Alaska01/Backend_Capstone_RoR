module Api
  module V1
    # UserController
    class UsersController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def create
        @user = User.new(user_params)
        if @user.save
          token = AuthenticationTokenService.encode(@user.id)
          render json: {
            token: token,
            username: @user.username
          }, status: :created
        else
          render json: { error: @user.errors }, status: :unprocessable_entity
        end
      end

      private

      def parameter_missing(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end

      def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
      end
    end
  end
end
