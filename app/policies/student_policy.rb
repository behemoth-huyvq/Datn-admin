class StudentPolicy < ApplicationPolicy
  def index?
    user.authorized_for(:student, :index)
  end

  def new?
    user.authorized_for(:student, :new)
  end

  def edit?
    user.authorized_for(:student, :edit)
  end

  def update?
    new?
  end

  def create?
    new?
  end

  def destroy?
    user.authorized_for(:student, :destroy)
  end
end
