class User < ApplicationRecord
  # dùng khi chọc vào db khác
  # self.table_name = "USER"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :permissions, through: :roles
end
