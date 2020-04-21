class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :name,
             :user_roles
  has_many :user_roles

  class UserRoleSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :role_id, :role
    belongs_to :role
  end
end