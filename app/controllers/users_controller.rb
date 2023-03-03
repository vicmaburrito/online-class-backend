class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /teachers or /teachers.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /teachers/1 or /teachers/1.json
  def show
    render json: @users
  end

  # POST  /teachers or /teachers.json
  def create
    @users= User.new(user_params)

    if @users.save
      render json: @users, status: :created, location: @users
    else
      render json: @users.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    if @users.update(user_params)
      render json: @users
    else
      render json: @users.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @users.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @users = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
end
