class StudentSerializer < ActiveModel::Serializer
  attributes :id, :student_code, :name, :dob, :class_name,
             :program
end
