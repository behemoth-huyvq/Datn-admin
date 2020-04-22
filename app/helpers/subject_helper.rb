module SubjectHelper
  def subject_index
    inner_options = {
      ":subject-type-option": Subject.pluck(:subject_type).uniq.to_json,
      ":department-option": Subject.pluck(:department).uniq.to_json
    }
    content_tag("subjects-index", nil, inner_options, false)
  end

  # def roles_new_page(role)
  #   inner_options = {
  #     ":role": role.to_json
  #   }
  #   content_tag('roles-new-page', nil, inner_options, false)
  # end

  # def roles_edit_page(role)
  #   inner_options = {
  #     ":role": role.to_json,
  #   }
  #   content_tag('roles-edit-page', nil, inner_options, false)
  # end
end
