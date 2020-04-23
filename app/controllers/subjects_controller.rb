class SubjectsController < BaseController
  include Pagy::Backend
  before_action :fetch_subject, only: %i[edit update destroy]
  before_action :authorization

  def index
    @q = Subject.order(id: :desc).ransack(params[:q])
    @pagy, @subjects = pagy(@q.result(distinct: true), items: params[:per_page])
    respond_to do |format|
      format.html
      format.json do
        render json: @subjects,
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
    @subject = Subject.new
  end

  def create
    form = SubjectValidator.new(OpenStruct.new(subject_params))

    if form.valid?
      @subject = Subject.new(subject_params)
      @subject.subject_code = Subject.last.subject_code[..2] + (Subject.last.subject_code[3..].to_i + 1).to_s
      @subject.save

      render json: @subject, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.destroy
    render json: { message: "Môn học đã bị xóa." }, status: :ok
  rescue StandardError => e
    Rails.logger.error("destroy failed; #{e.message}")
    render json: { message: "Xóa môn học thất bại. Vui lòng thử lại." }, status: :internal_server_error
  end

  def update
    form = SubjectValidator.new(OpenStruct.new(subject_params))

    if form.valid?
      @subject.update(subject_params)
      render json: @subject, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
    end
  end

  def authorization
    authorize Subject
  end

  private

  def subject_params
    params.require(:subject).permit(
      :subject_code, :subject_name, :subject_type,
      :credit_value, :jhi_desc, :department, :status, :credit_value_number
    )
  end

  def fetch_subject
    @subject = Subject.find(params[:id])
  end

  def set_title
    @title = "Quản lý môn học"
  end
end