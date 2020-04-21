module UserHelper
  def user_index
    inner_options = {
      ':role-options': Role.all.map do |role|
        {
          value: role.id,
          name: role.name,
        }
      end.to_json,
    }
    content_tag("users-index", nil, inner_options, false)
  end

  def users_new_page(user)
    inner_options = {
      ":user": user.to_json,
      ':role-options': Role.all.map do |role|
        {
          value: role.id,
          name: role.name,
        }
      end.to_json,
      ':user-roles-attributes': user.user_roles.to_json(except: %i[user_id created_at updated_at])
    }
    content_tag('users-new-page', nil, inner_options, false)
  end

  def users_edit_page(user)
    inner_options = {
      ":user": user.to_json,
      ':role-options': Role.all.map do |role|
        {
          value: role.id,
          name: role.name,
        }
      end.to_json,
      ':user-roles-attributes': user.user_roles.to_json(except: %i[user_id created_at updated_at])
    }
    content_tag('users-edit-page', nil, inner_options, false)
  end
end
