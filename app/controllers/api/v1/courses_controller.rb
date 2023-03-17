class  Api::V1::CoursesController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]  
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json
  def index
    @course = Course.all
    
    render json: @course
  end

  # GET /courses/1 or /courses/1.json
  def show
    render json: @course
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params.merge(user_id: @current_user.id))
    @course.user_id = @current_user.id

    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    if @course.update(course_params)
      render json: @course, status: :ok
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    if @course.destroy
      head :no_content
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.permit(:name,:description,:max_num_students,:picture, :user_id)
    end
end
