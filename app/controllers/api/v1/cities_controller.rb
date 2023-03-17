class Api::V1::CitiesController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]
  before_action :set_city, only: %i[ show edit update destroy ]

  # GET /cities or /cities.json
  def index
    @cities = City.all
    
    render json: @cities
  end

  # GET /cities/1 or /cities/1.json
  def show
    render json: @city
  end

  # POST /cities or /cities.json
  def create
    @city = City.new(city_params)

    if @city.save
      render json: @city, status: :created
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update
    if @city.update(city_params)
      render json: @city, status: :ok
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    if @city.destroy
      head :no_content
    else
      render json: { errors: @city.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.permit(:city_name)
    end
    
end
