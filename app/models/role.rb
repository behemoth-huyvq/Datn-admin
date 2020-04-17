class Role < ApplicationRecord
  # dùng khi chọc vào db khác
  # self.table_name = "ROLE"

  has_many :user_roles
  has_many :permissions
end
