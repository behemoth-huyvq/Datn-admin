class RolesController < BaseController
  include Pagy::Backend
  before_action :fetch_article, only: %i[edit update destroy]
  before_action :authorization

  def index
    @q = Role.order(id: :desc).ransack(params[:q])
    @pagy, @roles = pagy(@q.result(distinct: true), items: params[:per_page])
    respond_to do |format|
      format.html
      format.json do
        render json: @roles,
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
    @role = Role.new
  end

  def create
    role = Role.new(role_params)

    if role.save
      render json: role
    else
      render json: role.errors.to_hash(true).to_json, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      render json: @role
    else
      render json: @role.errors.to_hash(true).to_json, status: :unprocessable_entity
    end
  end

  def destroy
    @role.destroy
    render json: { message: "Quyền đã bị xóa." }, status: :ok
  rescue StandardError => e
    Rails.logger.error("destroy failed; #{e.message}")
    render json: { message: "Xóa bài thất bại. Vui lòng thử lại." }, status: :internal_server_error
  end

  private

  def authorization
    authorize Role
  end

  def fetch_article
    @role = Role.find(params[:id])
  end

  def set_title
    @title = "Quản lý quyền"
  end

  def role_params
    params.require(:role).permit(
      :name, :description
    )
  end
end