class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_params)

    user.api_key = User.set_api_key

    render json: UserSerializer.user(user), status: 201
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
