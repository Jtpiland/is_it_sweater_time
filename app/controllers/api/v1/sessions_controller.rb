class Api::V1::SessionsController < ApplicationController
#   skip_before_action :authorized?
#
  def create
    user = User.find_by(email: params[:email])
    if user.nil?
      render json: {data:{error:'Please create an account.'}}, :status => :not_found
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id

      render json: SessionSerializer.session(user)
    else
      render json: {data:{error:'Invalid Credentials.'}}, :status => :not_found
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {data:{}}, :status => 200
  end
end
