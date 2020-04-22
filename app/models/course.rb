class Course < ApplicationRecord
  self.table_name = "COURSE"

  belongs_to :subject

  enum status: {
    adjusted: 1,
    cancel: 2,
    doing: 3,
    end: 4,
  }

  def self.select_status_i18n
    Course.statuses_i18n.map do |i|
      {
        id: Course.statuses[i.first],
        value: i.last,
        key: i.first,
      }
    end
  end
end