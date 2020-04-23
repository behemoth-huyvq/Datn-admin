class StudentValidator
  include ActiveModel::Model

  attr_accessor :name, :dob,
                :class_name, :program

  validates :name, :dob,
            :class_name, :program, presence: true

  def initialize(attributes = {})
    @name = attributes.name
    @dob = attributes.dob
    @class_name = attributes.class_name
    @program = attributes.program
  end

  def error_messages
    errors.to_hash(true)
  end
end
