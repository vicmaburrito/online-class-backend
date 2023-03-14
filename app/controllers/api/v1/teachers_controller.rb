class Api::V1::TeachersController < ApplicationController
  before_action :set_teacher, only: %i[ show edit update destroy ]

  # GET /teachers or /teachers.json
  def index
    @teachers = Schedule.all

    render json: @teachers
  end

  # GET /teachers/1 or /teachers/1.json
  def show
    render json: @teachers
  end

  # POST  /teachers or /teachers.json
  def create
    @teachers= Teacher.new(teacher_params)

    if @teachers.save
      render json: @teachers, status: :created
    else
      render json: @teachers.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers/1 or /teachers/1.json
  def update
    if @teachers.update(teacher_params)
      render json: @teachers
    else
      render json: @teachers.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1 or /teachers/1.json
  def destroy
    @teachers.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teachers = Teacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_params
      params.permit(:name,:last_name,:degree)
    end
end
