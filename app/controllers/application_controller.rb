class ApplicationController < ActionController::API
    include JwtToken
    before_action :authenticate_user

    private

    def set_current_user(current_user)
      @current_user = current_user
    end

    def authenticate_user
      header = request.headers['Authorization']
      header = header.split(' ').last if header.present?
      begin 
          @decoded = jwt_decode(header)
          current_user = User.find(@decoded[:user_id])
          set_current_user(current_user)
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end
end