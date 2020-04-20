class RolePolicy < ApplicationPolicy
  def index?
    user.authorized_for(:all, :index)
  end

  def new?
    user.authorized_for(:all, :new)
  end

  def edit?
    user.authorized_for(:all, :edit)
  end

  def update?
    user.authorized_for(:all, :update)
  end

  def create?
    user.authorized_for(:all, :create)
  end

  def destroy?
    user.authorized_for(:all, :destroy)
  end
end
