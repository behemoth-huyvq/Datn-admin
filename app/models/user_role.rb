class UserRole < ApplicationRecord
  # dùng khi chọc vào db khác
  # self.table_name = "USER_ROLE"

  belongs_to :user
  belongs_to :role
end
