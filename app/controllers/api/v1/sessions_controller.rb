class Api::V1::SessionsController < ApplicationController
#   skip_before_action :authorized?
#
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      # flash[:error] = 'Email can not be blank.'
      # redirect_to root_path
      render json: :bad_request
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id

      render json: SessionSerializer.session(user)
    else
      flash[:error] = 'Sorry, your credentials are bad.'
      redirect_to root_path
      #render json?
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  # end
  end
end
