class SubjectPolicy < ApplicationPolicy
  def index?
    user.authorized_for(:subject, :index)
  end

  def new?
    user.authorized_for(:subject, :new)
  end

  def edit?
    user.authorized_for(:subject, :edit)
  end

  def update?
    new?
  end

  def create?
    new?
  end

  def destroy?
    user.authorized_for(:subject, :destroy)
  end
end
