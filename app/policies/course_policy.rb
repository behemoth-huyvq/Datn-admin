class CoursePolicy < ApplicationPolicy
  def index?
    user.authorized_for(:course, :index)
  end

  def new?
    user.authorized_for(:course, :new)
  end

  def edit?
    user.authorized_for(:course, :edit)
  end

  def update?
    new?
  end

  def create?
    new?
  end

  def destroy?
    user.authorized_for(:course, :destroy)
  end
end
