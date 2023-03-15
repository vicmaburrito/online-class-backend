class Api::V1::EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ show edit update destroy ]

  # GET /classes or /classes.json
  def index
    
    sql = "SELECT * from enrollments as a
          left join courses as b on a.course_id = b.id
          WHERE a.user_id = #{@current_user.id}"
    @enrollment = ActiveRecord::Base.connection.execute(sql)

    render json: @enrollment
  end 

  def index
    enrollments = Enrollment
                   .joins(:course)
                   .where(user_id: @current_user.id)
                   .select('enrollments.*, courses.*, enrollments.id AS enrollment_id')
    render json: enrollments
  end

  # GET /classes/1 or /classes/1.json
  def show
    render json: @enrollment
  end

  # POST /classes or /classes.json
  def create
    @enrollment = Enrollment.new(enrollment_params.merge(user_id:@current_user.id))    
    @enrollment.user_id = @current_user.id

    if @enrollment.save
      render json: { message: 'Booked successfully.' }, status: :created
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
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.permit(:sign_up_date,:course_id,:city_id,:user_id)
    end
end
