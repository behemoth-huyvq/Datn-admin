module CourseHelper
  def course_index
    inner_options = {
      ':status-option': Course.select_status_i18n.to_json,
    }
    content_tag("courses-index", nil, inner_options, false)
  end

  def courses_new_page(course)
    inner_options = {
      ":course": course.to_json,
      ':status-option': Course.select_status_i18n.to_json,
      ':subject-name-option': Subject.all.map do |subject|
        {
          value: subject.id,
          name: subject.subject_name,
        }
      end.to_json,
    }
    content_tag('courses-new-page', nil, inner_options, false)
  end

  def courses_edit_page(course)
    inner_options = {
      ":course": course.to_json,
      ':status-option': Course.select_status_i18n.to_json,
      ':subject-name-option': Subject.all.map do |subject|
        {
          value: subject.id,
          name: subject.subject_name,
        }
      end.to_json,
    }
    content_tag('courses-edit-page', nil, inner_options, false)
  end
end
