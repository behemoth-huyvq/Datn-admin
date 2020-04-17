# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_17_152732) do

  create_table "course", force: :cascade do |t|
    t.string "course_code"
    t.integer "max_slot", precision: 38
    t.integer "status", precision: 38
    t.integer "subject_id", precision: 38
    t.integer "current_slot", precision: 38
  end

  create_table "databasechangelog", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.string "author", null: false
    t.string "filename", null: false
    t.datetime "dateexecuted", precision: 6, null: false
    t.integer "orderexecuted", precision: 38, null: false
    t.string "exectype", limit: 10, null: false
    t.string "md5sum", limit: 35
    t.string "description"
    t.string "comments"
    t.string "tag"
    t.string "liquibase", limit: 20
    t.string "contexts"
    t.string "labels"
    t.string "deployment_id", limit: 10
  end

  create_table "databasechangeloglock", force: :cascade do |t|
    t.boolean "locked", null: false
    t.datetime "lockgranted", precision: 6
    t.string "lockedby"
  end

  create_table "fp_authority", primary_key: "name", id: :string, limit: 50, force: :cascade do |t|
  end

  create_table "fp_persistent_audit_event", primary_key: "event_id", force: :cascade do |t|
    t.string "principal", limit: 50, null: false
    t.datetime "event_date", precision: 6
    t.string "event_type"
    t.index ["principal", "event_date"], name: "idx_persistent_audit_event"
  end

  create_table "fp_persistent_audit_evt_data", primary_key: ["event_id", "name"], force: :cascade do |t|
    t.integer "event_id", precision: 38, null: false
    t.string "name", limit: 150, null: false
    t.string "value"
    t.index ["event_id"], name: "idx_persistent_audit_evt_data"
  end

  create_table "fp_user", force: :cascade do |t|
    t.string "login", limit: 50, null: false
    t.string "password_hash", limit: 60, null: false
    t.string "first_name", limit: 50
    t.string "last_name", limit: 50
    t.string "email", limit: 191
    t.string "image_url", limit: 256
    t.boolean "activated", null: false
    t.string "lang_key", limit: 10
    t.string "activation_key", limit: 20
    t.string "reset_key", limit: 20
    t.string "created_by", limit: 50, null: false
    t.datetime "created_date", precision: 6
    t.datetime "reset_date", precision: 6
    t.string "last_modified_by", limit: 50
    t.datetime "last_modified_date", precision: 6
    t.integer "student_id", precision: 38
    t.index ["email"], name: "ux_user_email", unique: true
    t.index ["login"], name: "ux_user_login", unique: true
    t.index ["student_id"], name: "ux_student_account_id", unique: true
  end

  create_table "fp_user_authority", primary_key: ["user_id", "authority_name"], force: :cascade do |t|
    t.integer "user_id", precision: 38, null: false
    t.string "authority_name", limit: 50, null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "role_id", precision: 38, null: false
    t.integer "authorization_id", precision: 38, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id", "authorization_id"], name: "index_permissions_on_role_id_and_authorization_id", unique: true
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "register", force: :cascade do |t|
    t.string "semester", limit: 100
    t.integer "student_id", precision: 38, null: false
    t.integer "course_id", precision: 38, null: false
    t.string "status", limit: 100
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedule", force: :cascade do |t|
    t.string "week_value"
    t.string "week_day_value"
    t.string "period_value"
    t.string "location", limit: 200
    t.integer "course_id", precision: 38
  end

  create_table "student", force: :cascade do |t|
    t.string "student_code", null: false
    t.string "name"
    t.string "dob"
    t.string "class_name"
    t.string "program"
    t.index ["student_code"], name: "ux_student_student_code", unique: true
  end

  create_table "subject", force: :cascade do |t|
    t.string "subject_code", limit: 100
    t.string "subject_name", limit: 300
    t.string "subject_type", limit: 50
    t.string "credit_value", limit: 30
    t.string "jhi_desc", limit: 300
    t.string "department", limit: 200
    t.integer "status", precision: 38
    t.integer "credit_value_number", limit: 10, precision: 10
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", precision: 38
    t.integer "role_id", precision: 38
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "course", "subject", name: "fk_course_subject_id", on_delete: :cascade
  add_foreign_key "fp_persistent_audit_evt_data", "fp_persistent_audit_event", column: "event_id", primary_key: "event_id", name: "fk_evt_pers_audit_evt_data"
  add_foreign_key "fp_user", "student", name: "fk_student_account_id"
  add_foreign_key "fp_user_authority", "fp_authority", column: "authority_name", primary_key: "name", name: "fk_authority_name"
  add_foreign_key "fp_user_authority", "fp_user", column: "user_id", name: "fk_user_id"
  add_foreign_key "register", "course", name: "register_course_fk"
  add_foreign_key "register", "student", name: "register_student_fk"
  add_foreign_key "schedule", "course", name: "fk_schedule_course_id", on_delete: :cascade
end
