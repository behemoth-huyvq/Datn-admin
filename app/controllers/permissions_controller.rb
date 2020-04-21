class PermissionsController < BaseController
  before_action :authorization

  def index; end

  def create
    render(json: "Không thể thêm quyền quản trị", status: :unprocessable_entity) && return if params[:authorizationId] == 9999 || params[:roleId] == 1
    permission = Permission.new(authorization_id: params[:authorizationId], role_id: params[:roleId])
    permission.save!
    render json: "Success", status: :ok
  rescue StandardError => e
    Rails.logger.error("failed to add permission whith: role = #{params[:roleId]}, authId: #{params[:authorizationId]}. Details: #{e}")
    render json: e.message, status: :unprocessable_entity
  end

  def remove
    render(json: "Không thể xóa quyền quản trị", status: :unprocessable_entity) && (return true) if params[:authorizationId] == 9999 || params[:roleId] == 1
    p = Permission.find_by(authorization_id: params[:authorizationId], role_id: params[:roleId])
    p.destroy!
  rescue StandardError => e
    Rails.logger.error("failed to remove permission whith: role = #{params[:roleId]}, authId: #{params[:authorizationId]}. Details: #{e}")
    render json: e.message, status: :unprocessable_entity
  end

  def authorization
    authorize Permission
  end

  private

  def set_title
    @title = "Quản lý ủy quyền"
  end
end