class Authorization < ActiveHash::Base
  fields :id, :target, :action, :name

  add id: 100, target: :subject, action: :index, name: "Xem danh sách môn học"
  add id: 101, target: :subject, action: :new, name: "Tạo mới môn học"
  add id: 102, target: :subject, action: :edit, name: "Chỉnh sửa môn học"
  add id: 103, target: :subject, action: :destroy, name: "Xoá môn học"

  add id: 110, target: :student, action: :index, name: "Xem danh sách sinh viên"
  add id: 111, target: :student, action: :new, name: "Tạo mới sinh viên"
  add id: 112, target: :student, action: :edit, name: "Chỉnh sửa sinh viên"
  add id: 113, target: :student, action: :destroy, name: "Xoá sinh viên"

  add id: 120, target: :course, action: :index, name: "Xem danh sách học phần"
  add id: 121, target: :course, action: :new, name: "Tạo mới học phần"
  add id: 122, target: :course, action: :edit, name: "Chỉnh sửa học phần"
  add id: 123, target: :course, action: :destroy, name: "Xoá học phần"

  add id: 130, target: :schedule, action: :index, name: "Xem danh sách lịch học"
  add id: 131, target: :schedule, action: :new, name: "Tạo mới lịch học"
  add id: 132, target: :schedule, action: :edit, name: "Chỉnh sửa lịch học"
  add id: 133, target: :schedule, action: :destroy, name: "Xoá lịch học"

  # this is super admin
  add id: 9999, target: :all

  def self.target_names
    {
      subject: "Quản lý môn học",
      student: "Quản lý sinh viên",
      course: "Quản lý học phần",
      schedule: "Quản lý lịch học",
    }
  end

  def target_name
    Authorization.target_names[target]
  end
end