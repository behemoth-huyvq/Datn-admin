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

  def new
    @student = Student.new
  end

  def create
    form = StudentValidator.new(OpenStruct.new(student_params))

    if form.valid?
      @student = Student.new(student_params)
      @student.student_code = Student.last.student_code[..3] + (Student.last.student_code[4..].to_i + 1).to_s
      @student.save

      render json: @student, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
    end
  end

  def edit
    @student.dob = @student.dob.to_date
  end

  def update
    form = StudentValidator.new(OpenStruct.new(student_params))

    if form.valid?
      @student.update(student_params)
      render json: @student, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
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

  def student_params
    params.require(:student).permit(
      :student_code, :name, :dob,
      :class_name, :program
    )
  end

  def fetch_student
    @student = Student.find(params[:id])
  end

  def set_title
    @title = "Quản lý sinh viên"
  end
end