class Schedule < ApplicationRecord
  self.table_name = "SCHEDULE"

  belongs_to :course
end