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

  def fetch_schedule
    @schedule = Schedule.find(params[:id])
  end

  def set_title
    @title = "Quản lý lịch học của học phần"
  end
end