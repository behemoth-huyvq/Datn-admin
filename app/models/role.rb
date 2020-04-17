class Role < ApplicationRecord
  has_many :user_roles
  has_many :permissions
end
