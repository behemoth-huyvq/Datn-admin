class CoursesController < BaseController
  include Pagy::Backend
  before_action :fetch_course, only: %i[edit update destroy]
  before_action :authorization

  def index
    @q = Course.order(id: :desc).ransack(params[:q])
    @pagy, @courses = pagy(@q.result(distinct: true), items: params[:per_page])
    respond_to do |format|
      format.html
      format.json do
        render json: @courses,
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
    @course = Course.new
  end

  def create
    form = CourseValidator.new(OpenStruct.new(course_params))

    if form.valid?
      @course = Course.new(course_params)
      @course.course_code = Course.last.course_code[..3] + (Course.last.course_code[4..].to_i + 1).to_s
      @course.save

      render json: @course, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
    end
  end

  def update
    form = CourseValidator.new(OpenStruct.new(course_params))

    if form.valid?
      @course.update(course_params)
      render json: @course, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    render json: { message: "Học phần đã bị xóa." }, status: :ok
  rescue StandardError => e
    Rails.logger.error("destroy failed; #{e.message}")
    render json: { message: "Xóa học phần thất bại. Vui lòng thử lại." }, status: :internal_server_error
  end

  def authorization
    authorize Course
  end

  private

  def course_params
    params.require(:course).permit(
      :course_code, :max_slot, :status,
      :subject_id, :current_slot
    )
  end

  def fetch_course
    @course = Course.find(params[:id])
  end

  def set_title
    @title = "Quản lý học phần"
  end
end