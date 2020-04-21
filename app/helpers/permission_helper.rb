module PermissionHelper
  def permission_index
    inner_options = {
      ":authorizations": Authorization.where.not(id: 9999).group_by(&:target_name).map do |item|
        {
          target_name: item[0],
          authorizations: item[1].map do |authorization|
            {
              id: authorization.id,
              target_name: authorization.target,
              action: authorization.action,
              name: authorization.name,
            }
          end,
        }
      end.to_json,
      ":permissions": Permission.all.to_json,
      ":roles": Role.all.to_json,
    }

    content_tag("permissions-index", nil, inner_options, false)
  end
end
