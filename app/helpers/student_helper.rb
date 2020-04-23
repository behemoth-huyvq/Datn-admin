module StudentHelper
  def student_index
    inner_options = {
      ":program-option": Student.pluck(:program).uniq.to_json,
      ":class-name-option": Student.pluck(:class_name).uniq.to_json
    }
    content_tag("students-index", nil, inner_options, false)
  end

  def students_new_page(student)
    inner_options = {
      ":student": student.to_json,
      ":program-option": Student.pluck(:program).uniq.to_json,
      ":class-name-option": Student.pluck(:class_name).uniq.to_json
    }
    content_tag('students-new-page', nil, inner_options, false)
  end

  def students_edit_page(student)
    inner_options = {
      ":student": student.to_json,
      ":program-option": Student.pluck(:program).uniq.to_json,
      ":class-name-option": Student.pluck(:class_name).uniq.to_json
    }
    content_tag('students-edit-page', nil, inner_options, false)
  end
end
