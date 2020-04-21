class UserValidator
  include ActiveModel::Model

  attr_accessor :id, :user_roles, :email, :name, :password

  validates :user_roles, :email, :name, presence: true

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validate :email_uniqueness
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validate :user_roles_uniq?
  validate :check_roles_valid?
  validate :check_user_roles_current_user?, on: :update


  def initialize(attributes = {})
    @id = attributes.id
    @email = attributes.email
    @password = attributes.password
    @name = attributes.name
    @user_roles = attributes.user_roles_attributes.reject do |p|
      p[:_destroy]
    end
    @user_roles_destroy = attributes.user_roles_attributes.reject do |p|
      !p[:_destroy]
    end
  end

  def error_messages
    errors.to_hash(true)
  end

  def check_roles_valid?
    return if (@user_roles.pluck(:role_id) - Role.all.pluck(:id)).empty?

    errors.add(:user_roles, :does_not_exist)
  end

  def user_roles_uniq?
    return unless @user_roles.count != @user_roles.uniq { |userRole| userRole[:role_id] }.count

    errors.add(:user_roles, :duplicate)
  end

  def check_user_roles_current_user?
    current_user_roles = User.find(@id).user_roles.pluck(:role_id)
      new_user_roles = @user_roles.select { |u_r| !u_r[:id] }
      if new_user_roles.present? && @user_roles_destroy.present?
        new_user_roles.each do |n_u_r|
          new_user_roles_delete_record_destroy = current_user_roles - @user_roles_destroy.pluck(:role_id)
          if new_user_roles_delete_record_destroy.include?(n_u_r[:role_id])
            errors.add(:user_roles, :duplicate)
            return
          end
        end
      elsif new_user_roles
        new_user_roles.each do |n_u_r|
          if current_user_roles.include?(n_u_r[:role_id])
            return
          end
        end
      end
  end

  def email_uniqueness
    return unless User.where(email: @email).where.not(id: @id).exists?

    errors.add(:email, :was_used)
  end
end
