class ClassesController < ApplicationController
  before_action :set_class, only: %i[ show edit update destroy ]

  # GET /classes or /classes.json
  def index
    @classes = Class.all

    render json: @classes
  end

  # GET /classes/1 or /classes/1.json
  def show
    render json: @class
  end

  # POST /classes or /classes.json
  def create
    @class = Class.new(class_params)

    if @class.save
      render json: @class, status: :created, location: @class
    else
      render json: @class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classes/1 or /classes/1.json
  def update
    if @class.update(class_params)
      render json: @class
    else
      render json: @class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classes/1 or /classes/1.json
  def destroy
    @class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class
      @class = Class.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def class_params
      params.fetch(:class, {})
    end
end
