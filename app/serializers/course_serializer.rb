class CourseSerializer < ActiveModel::Serializer
  attributes :id, :course_code, :max_slot, :status_i18n, :current_slot,
             :subject

  belongs_to :subject
end
