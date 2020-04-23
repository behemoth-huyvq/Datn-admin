module ScheduleHelper
  def schedule_index
    # inner_options = {
    #   ":program-option": Student.pluck(:program).uniq.to_json,
    #   ":class-name-option": Student.pluck(:class_name).uniq.to_json
    # }
    content_tag("schedules-index", nil, nil, false)
  end

  def schedules_new_page(schedule)
    inner_options = {
      ":schedule": schedule.to_json,
      ':course-code-option': Course.all.map do |course|
        {
          value: course.id,
          code: course.course_code,
        }
      end.to_json,
    }
    content_tag('schedules-new-page', nil, inner_options, false)
  end

  def schedules_edit_page(schedule)
    inner_options = {
      ":schedule": schedule.to_json,
      ':course-code-option': Course.all.map do |course|
        {
          value: course.id,
          code: course.course_code,
        }
      end.to_json,
    }
    content_tag('schedules-edit-page', nil, inner_options, false)
  end
end
