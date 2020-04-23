class ScheduleValidator
  include ActiveModel::Model

  attr_accessor :week_value, :week_day_value, :period_value,
                :location, :course_id

  validates :week_value, :week_day_value, :period_value,
            :location, :course_id, presence: true
  validates :course_id, numericality: { only_integer: true }

  def initialize(attributes = {})
    @week_value = attributes.week_value
    @week_day_value = attributes.week_day_value
    @period_value = attributes.period_value
    @location = attributes.location
    @course_id = attributes.course_id
  end

  def error_messages
    errors.to_hash(true)
  end
end
