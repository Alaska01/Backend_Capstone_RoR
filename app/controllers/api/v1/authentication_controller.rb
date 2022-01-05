module Api
  module V1
    # AuthenticationController
    class AuthenticationController < ApplicationController
      class AuthenticationError < StandardError; end
      rescue_from ActionController::ParameterMissing, with: :missing_parameter
      rescue_from AuthenticationError, with: :handle_unauthenticated

      def create
        raise AuthenticationError unless user.authenticate(params[:password])

        token = AuthenticationTokenService.encode(user.id)
        render json: {
          username: user.username.capitalize,
          token: token
        }, status: :created
      end

      private

      def user
        @user ||= User.find_by(username: params.require(:username))
      end

      def missing_parameter
        render json: { error: 'param is missing or the value is empty' }, status: :unprocessable_entity
      end

      def handle_unauthenticated
        head :unauthorized
      end
    end
  end
end
