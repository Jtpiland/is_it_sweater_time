class Api::V1::UsersController < ApplicationController
# skip_before_action :authorized?

  def create
    user = User.create!(user_params)
    user.api_key = User.set_api_key
    # session[:user_id] = user.id
    user.save

    render json: UserSerializer.user(user), status: 201
  end

  # user = user_params
  #     user[:email] = user[:email].downcase
  #     new_user = User.new(user)
  #     if new_user.save
  #       session[:user_id] = new_user.id
  #       flash[:success] = "Welcome, #{new_user.email}!"
  #       redirect_to dashboard_path
  #     else
  #       flash[:error] = new_user.errors.full_messages.to_sentence
  #       redirect_to register_path
  #     end
  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
