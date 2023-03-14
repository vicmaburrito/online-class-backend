class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action :set_user, only: %i[ show update destroy ]

  # GET /teachers or /teachers.json
  def index
    @users = User.all

    render json: @users, status: 200
  end

  # GET /teachers/1 or /teachers/1.json
  def show
    render json: @user, status: 200
  end

  # POST  /teachers or /teachers.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: '{"message":"Signed up."}', status: 201

    else
      render json: @user.errors, status: 503
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    unless @user.update(user_params)
      render json: @users.errors, status: :unprocessable_entity 
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @users = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :email, :password)
    end
end
