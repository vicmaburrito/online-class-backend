class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user, only: [:login]


  def login
    @user = User.find_by(email: params[:email])&.authenticate(params[:password])
    if @user
      token = jwt_encode({ user_id: @user.id })
      time = Time.now + 24.hours.to_i
      render json: { token: token , role:"client", exp: time.strftime("%m-%d-%Y %H:%M"), username: @user.username, user_id: @user.id }, status: :ok
    else
      render json: { errors: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
