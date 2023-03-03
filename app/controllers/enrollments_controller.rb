class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ show edit update destroy ]

  # GET /classes or /classes.json
  def index
    @enrollment = Enrollment.all

    render json: @enrollment
  end

  # GET /classes/1 or /classes/1.json
  def show
    render json: @enrollment
  end

  # POST /classes or /classes.json
  def create
    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save
      render json: @enrollment, status: :created, location: @enrollment
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classes/1 or /classes/1.json
  def update
    if @enrollment.update(enrollment_params)
      render json: @enrollment
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classes/1 or /classes/1.json
  def destroy
    @enrollment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @city = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.fetch(:enrollment, {})
    end
end
