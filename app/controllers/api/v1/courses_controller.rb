class  Api::V1::CoursesController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]  
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /classes or /classes.json
  def index
    @course = Course.all
    
    render json: @course
  end

  # GET /classes/1 or /classes/1.json
  def show
    render json: @course
  end

  # POST /classes or /classes.json
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classes/1 or /classes/1.json
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classes/1 or /classes/1.json
  def destroy
    @course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.permit(:name,:description,:max_num_students,:teacher_id)
    end
end
