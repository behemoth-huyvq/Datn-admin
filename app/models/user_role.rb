class UserRole < ApplicationRecord
  # dùng khi chọc vào db khác
  # self.table_name = "USER_ROLE"

  belongs_to :member
  belongs_to :role
end
