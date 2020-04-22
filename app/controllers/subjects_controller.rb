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

  def destroy
    @subject.destroy
    render json: { message: "Môn học đã bị xóa." }, status: :ok
  rescue StandardError => e
    Rails.logger.error("destroy failed; #{e.message}")
    render json: { message: "Xóa môn học thất bại. Vui lòng thử lại." }, status: :internal_server_error
  end

  def authorization
    authorize Subject
  end

  private

  def fetch_subject
    @subject = Subject.find(params[:id])
  end

  def set_title
    @title = "Quản lý môn học"
  end
end