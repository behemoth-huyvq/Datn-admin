class SchedulePolicy < ApplicationPolicy
  def index?
    user.authorized_for(:schedule, :index)
  end

  def new?
    user.authorized_for(:schedule, :new)
  end

  def edit?
    user.authorized_for(:schedule, :edit)
  end

  def update?
    new?
  end

  def create?
    new?
  end

  def destroy?
    user.authorized_for(:schedule, :destroy)
  end
end
