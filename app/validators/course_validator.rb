class CourseValidator
  include ActiveModel::Model

  attr_accessor :max_slot, :subject_id, :status, :current_slot

  validates :max_slot, :current_slot, numericality: { only_integer: true }
  validates :max_slot, :status, :subject_id, presence: true

  def initialize(attributes = {})
    @max_slot = attributes.max_slot
    @status = attributes.status
    @subject_id = attributes.subject_id
    @current_slot = attributes.current_slot
  end

  def error_messages
    errors.to_hash(true)
  end
end
