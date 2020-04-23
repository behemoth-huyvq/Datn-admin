class SchedulesController < BaseController
  include Pagy::Backend
  before_action :fetch_schedule, only: %i[edit update destroy]
  before_action :authorization

  def index
    @q = Schedule.order(id: :desc).ransack(params[:q])
    @pagy, @schedules = pagy(@q.result(distinct: true), items: params[:per_page])
    respond_to do |format|
      format.html
      format.json do
        render json: @schedules,
               adapter: :json,
               meta: {
                 total: @pagy.count,
                 page: @pagy.page,
                 from: @pagy.from,
                 to: @pagy.to,
                 series: @pagy.series,
                 pages: @pagy.pages,
               }
      end
    end
  end

  def new
    @schedule = Schedule.new
  end

  def create
    form = ScheduleValidator.new(OpenStruct.new(schedule_params))

    if form.valid?
      @schedule = Schedule.new(schedule_params)
      @schedule.save

      render json: @schedule, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
    end
  end

  def update
    form = ScheduleValidator.new(OpenStruct.new(schedule_params))

    if form.valid?
      @schedule.update(schedule_params)
      render json: @schedule, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    render json: { message: "Lịch học đã bị xóa." }, status: :ok
  rescue StandardError => e
    Rails.logger.error("destroy failed; #{e.message}")
    render json: { message: "Xóa lịch học thất bại. Vui lòng thử lại." }, status: :internal_server_error
  end

  def authorization
    authorize Student
  end

  private

  def schedule_params
    params.require(:schedule).permit(
      :week_value, :week_day_value, :period_value,
      :location, :course_id
    )
  end

  def fetch_schedule
    @schedule = Schedule.find(params[:id])
  end

  def set_title
    @title = "Quản lý lịch học của học phần"
  end
end