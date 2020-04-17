class Authorization < ActiveHash::Base
  fields :id, :target, :action

  # add id: 100, target: :url, action: :index

  # this is super admin
  add id: 9999, target: :all, action: :all
end