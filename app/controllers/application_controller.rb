class ApplicationController < ActionController::Base
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :authenticate_user!
  before_action :set_title

  include Pundit

  def set_title
    @title = "Dashboard"
  end

  private

  def user_not_authorized(_exception)
    flash[:alert] = "Bạn không được phép thực hiện hành động này."
    redirect_to(request.referer || root_path)
  end
end
