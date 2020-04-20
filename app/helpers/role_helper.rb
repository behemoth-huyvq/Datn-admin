module RoleHelper
  def role_index
    content_tag("role-index", nil, nil, false)
  end

  def roles_new_page(role)
    inner_options = {
      ":role": role.to_json
    }
    content_tag('roles-new-page', nil, inner_options, false)
  end

  def roles_edit_page(role)
    inner_options = {
      ":role": role.to_json,
    }
    content_tag('roles-edit-page', nil, inner_options, false)
  end
end
