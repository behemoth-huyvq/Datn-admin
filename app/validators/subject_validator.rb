class SubjectValidator
  include ActiveModel::Model

  attr_accessor :subject_name, :subject_type,
                :credit_value, :jhi_desc, :department, :status, :credit_value_number

  validates :credit_value_number, numericality: { only_integer: true }, allow_blank: true
  validates :subject_name, :subject_type, :credit_value,
            :jhi_desc, :department, :status, presence: true

  def initialize(attributes = {})
    @subject_name = attributes.subject_name
    @subject_type = attributes.subject_type
    @credit_value = attributes.credit_value
    @jhi_desc = attributes.jhi_desc
    @department = attributes.department
    @status = attributes.status
    @credit_value_number = attributes.credit_value_number
  end

  def error_messages
    errors.to_hash(true)
  end
end
