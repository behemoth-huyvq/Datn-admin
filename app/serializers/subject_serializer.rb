class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :subject_code, :subject_name, :subject_type, :credit_value,
             :jhi_desc, :department, :status, :credit_value_number
end
