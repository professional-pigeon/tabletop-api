module Api
  class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

    def login
      @user = User.find_by_user_name(params[:user_name])
      if @user&.authenticate(params[:password])
        session[:user_id] = @user.id
        render json: @user, status: :ok
      else
        render json: { error: 'Error with username or password' }, status: :unauthorized
      end
    end

    def logout
      session.delete(:user_id)
      render json: { message: 'successfully logged out'}
    end

    private

    def login_params
      params.permit(:email, :password)
    end
  end
end