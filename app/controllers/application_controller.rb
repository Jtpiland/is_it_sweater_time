class ApplicationController < ActionController::API
  # # protect_from_forgery with: :exception
  # helper_method :current_user
  # before_action :authorized?
  #
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # def current_user
  #   User.find(session[:user_id]) if session[:user_id]
  # end
  #
  # def authorized?
  #   if current_user.nil?
  #     flash[:error] = 'Please Log-In.'
  #     redirect_to root_path
  #     #render json?
  #   end
  # end
  #
  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :bad_request
  end

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
