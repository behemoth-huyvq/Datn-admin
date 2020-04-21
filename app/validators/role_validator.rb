class RoleValidator
  include ActiveModel::Model

  attr_accessor :name

  validates :name, presence: true

  def initialize(attributes = {})
    @name = attributes.name
  end

  def error_messages
    errors.to_hash(true)
  end
end
