class ApplicationController < ActionController::API
def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    if session[:user_id]
      begin 
        @user = User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      end
    else 
      render json: { errors: 'not logged in' }, status: :unauthorized
    end
  end
end
