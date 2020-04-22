module CourseHelper
  def course_index
    inner_options = {
      ':status-option': Course.select_status_i18n.to_json,
    }
    content_tag("courses-index", nil, inner_options, false)
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
