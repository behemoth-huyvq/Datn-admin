class PermissionPolicy < ApplicationPolicy
  def index?
    user.authorized_for(:all, :index)
  end

  def create?
    user.authorized_for(:all, :create)
  end

  def remove?
    user.authorized_for(:all, :remove)
  end
end
