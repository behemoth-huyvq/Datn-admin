class Permission < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :role
  belongs_to_active_hash :authorization
end
