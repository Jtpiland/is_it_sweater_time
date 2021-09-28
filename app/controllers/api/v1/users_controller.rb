class Api::V1::UsersController < ApplicationController

  def create
    user = User.create!(user_params)
    user.api_key = User.set_api_key

    user.save

    render json: UserSerializer.user(user), status: 201
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
