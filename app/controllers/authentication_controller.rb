class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user, only: [:login]


  def login
    @user = User.find_by(email: params[:email])&.authenticate(params[:password])
    if @user
      token = jwt_encode({ user_id: @user.id })
      time = Time.now + 24.hours.to_i
      render json: { token: token , exp: time.strftime("%m-%d-%Y %H:%M"), username: @user.username }, status: :ok
    else
      render json: { errors: @user }, status: :unauthorized
    end
  end
end
