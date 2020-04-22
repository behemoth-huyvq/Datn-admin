class UsersController < BaseController
  include Pagy::Backend
  before_action :fetch_user, only: %i[edit update destroy]
  before_action :authorization

  def index
    @q = User.order(id: :desc).ransack(params[:q])
    @pagy, @users = pagy(@q.result(distinct: true), items: params[:per_page])
    respond_to do |format|
      format.html
      format.json do
        render json: @users,
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
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def create
    form = UserValidator.new(OpenStruct.new(user_params))

    if form.valid?(:create)
      user = User.create!(user_params)
      render json: user, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    form = UserValidator.new(OpenStruct.new(user_params))

    if form.valid?(:update)
      @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: form.error_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: { message: "Quản trị viên đã bị xóa." }, status: :ok
  rescue StandardError => e
    Rails.logger.error("destroy failed; #{e.message}")
    render json: { message: "Xóa quản trị viên thất bại. Vui lòng thử lại." }, status: :internal_server_error
  end

  def authorization
    authorize User
  end

  private

  def fetch_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :id, :email, :password, :name,
      user_roles_attributes: %i[
        id role_id _destroy
      ]
    )
  end
end
