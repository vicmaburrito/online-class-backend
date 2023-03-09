class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]

  # GET /schedules or /schedules.json
  def index
    @schedules = Schedule.all

    render json: @schedules
  end

  # GET schedules/1 or schedules/1.json
  def show
    render json: @schedules
  end

  # POST  /schedules or /schedules.json
  def create
    @schedules = Schedule.new(schedule_params)

    if @schedules.save
      render json: @schedules, status: :created, location: @schedules
    else
      render json: @schedules.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT schedules/1 or schedules/1.json
  def update
    if @schedules.update(schedule_params)
      render json: @schedules
    else
      render json: @schedules.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedules.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedules = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.fetch(:schedule,_:day_of_week,:start_time,:duration,:course_id,:course_id)
    end
end
