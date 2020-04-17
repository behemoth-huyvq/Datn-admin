class Permission < ApplicationRecord
  # dùng khi chọc vào db khác
  # self.table_name = "PERMISSION"
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :role
  belongs_to_active_hash :authorization
end
