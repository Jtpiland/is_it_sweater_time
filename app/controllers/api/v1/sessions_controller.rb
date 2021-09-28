class Api::V1::SessionsController < ApplicationController

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
end
