class StudentsController < BaseController
  include Pagy::Backend
  before_action :fetch_student, only: %i[edit update destroy]
  before_action :authorization

  def index
    @q = Student.order(id: :desc).ransack(params[:q])
    @pagy, @students = pagy(@q.result(distinct: true), items: params[:per_page])
    respond_to do |format|
      format.html
      format.json do
        render json: @students,
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
    @student.destroy
    render json: { message: "Sinh viên đã bị xóa." }, status: :ok
  rescue StandardError => e
    Rails.logger.error("destroy failed; #{e.message}")
    render json: { message: "Xóa sinh viên thất bại. Vui lòng thử lại." }, status: :internal_server_error
  end

  def authorization
    authorize Student
  end

  private

  def fetch_student
    @student = Student.find(params[:id])
  end

  def set_title
    @title = "Quản lý sinh viên"
  end
end