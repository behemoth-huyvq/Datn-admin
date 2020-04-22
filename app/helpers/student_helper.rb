module StudentHelper
  def student_index
    inner_options = {
      ":program-option": Student.pluck(:program).uniq.to_json,
      ":class-name-option": Student.pluck(:class_name).uniq.to_json
    }
    content_tag("students-index", nil, inner_options, false)
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
