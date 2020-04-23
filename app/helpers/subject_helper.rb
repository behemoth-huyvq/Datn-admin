module SubjectHelper
  def subject_index
    inner_options = {
      ":subject-type-option": Subject.pluck(:subject_type).uniq.to_json,
      ":department-option": Subject.pluck(:department).uniq.to_json
    }
    content_tag("subjects-index", nil, inner_options, false)
  end

  def subjects_new_page(subject)
    inner_options = {
      ":subject": subject.to_json,
      ":subject-type-option": Subject.pluck(:subject_type).uniq.to_json,
      ":department-option": Subject.pluck(:department).uniq.to_json
    }
    content_tag('subjects-new-page', nil, inner_options, false)
  end

  def subjects_edit_page(subject)
    inner_options = {
      ":subject": subject.to_json,
      ":subject-type-option": Subject.pluck(:subject_type).uniq.to_json,
      ":department-option": Subject.pluck(:department).uniq.to_json
    }
    content_tag('subjects-edit-page', nil, inner_options, false)
  end
end
