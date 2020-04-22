class Subject < ApplicationRecord
  self.table_name = "SUBJECT"

  has_many :course

  enum status: {
    active: 1,
    archived: 0,
  }
end