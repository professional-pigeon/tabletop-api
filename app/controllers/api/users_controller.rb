module Api
  class UsersController < ApplicationController
    before_action :authorize_request, except: :create

    def create
      create_params(params)
      @user = User.new(@create_params)
      @user.password = params[:password]
      if @user.save
        session[:user_id] = @user.id
        render json: @user, status: :ok
      else
        render json: { error: 'Error creating user' }, status: :unauthorized
      end
    end

    def index
      user = User.find(session[:user_id])
      serialized_res = UserBlueprint.render(user)
      render json: serialized_res
    end

    def destroy
    end

    def update
    end

    private
    def create_params(params)
      @create_params ||= params.permit(:email, :password, :user_name)
    end
  end
end