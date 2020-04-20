class User < ApplicationRecord
  # dùng khi chọc vào db khác
  # self.table_name = "USER"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :registerable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :permissions, through: :roles

  def authorizations
    permissions.map(&:authorization).map do |authorization|
      OpenStruct.new(
        {
          target: authorization.target,
          action: authorization.action,
        },
      )
    end
  end

  def authorized_for(target, action)
    authorizations.detect do |authorization|
      authorization.target == :all ||
        (
          authorization.target == target &&
          authorization.action == action
        )
    end
  end
end
