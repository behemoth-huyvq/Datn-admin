class Subject < ApplicationRecord
  self.table_name = "SUBJECT"

  enum status: {
    active: 1,
    archived: 0,
  }
end