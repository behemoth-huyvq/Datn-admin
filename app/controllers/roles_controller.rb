class RolesController < BaseController
  include Pagy::Backend
  before_action :fetch_role, only: %i[edit update destroy]
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
    form = RoleValidator.new(OpenStruct.new(role_params))

    if form.valid?
      role = Role.create!(role_params)
      render json: role, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
    end
  end

  def update
      form = RoleValidator.new(OpenStruct.new(role_params))

      if form.valid?
        @role.update(role_params)
        render json: @role, status: :ok
      else
        render json: form.error_messages, status: :unprocessable_entity
      end
  end

  def destroy
    @role.destroy
    render json: { message: "Chức vụ đã bị xóa." }, status: :ok
  rescue StandardError => e
    Rails.logger.error("destroy failed; #{e.message}")
    render json: { message: "Xóa chức vụ thất bại. Vui lòng thử lại." }, status: :internal_server_error
  end

  private

  def authorization
    authorize Role
  end

  def fetch_role
    @role = Role.find(params[:id])
  end

  def set_title
    @title = "Quản lý chức vụ"
  end

  def role_params
    params.require(:role).permit(
      :name, :description
    )
  end
end