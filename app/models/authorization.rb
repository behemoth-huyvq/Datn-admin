class Authorization < ActiveHash::Base
  fields :id, :target, :action, :name

  add id: 100, target: :role, action: :index, name: "Xem danh sách chức vụ"
  add id: 101, target: :role, action: :new, name: "Tạo mới chức vụ"
  add id: 102, target: :role, action: :edit, name: "Chỉnh sửa chức vụ"
  add id: 103, target: :role, action: :destroy, name: "Xoá chức vụ"

  add id: 120, target: :user, action: :index, name: "Xem danh sách quản trị viên"
  add id: 121, target: :user, action: :new, name: "Tạo mới quản trị viên"
  add id: 122, target: :user, action: :edit, name: "Chỉnh sửa quản trị viên"
  add id: 123, target: :user, action: :destroy, name: "Xoá quản trị viên"

  # this is super admin
  add id: 9999, target: :all

  def self.target_names
    {
      role: "Quản lý chức vụ",
      user: "Quản lý quản trị viên",
      # user_role: "Quản lý ủy quyền",
    }
  end

  def target_name
    Authorization.target_names[target]
  end
end