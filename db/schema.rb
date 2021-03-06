# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161215113842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contribution_images", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "copyright"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "image_data"
    t.index ["project_id"], name: "index_contribution_images_on_project_id", using: :btree
    t.index ["user_id"], name: "index_contribution_images_on_user_id", using: :btree
  end

  create_table "contribution_texts", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_contribution_texts_on_project_id", using: :btree
    t.index ["user_id"], name: "index_contribution_texts_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nickname"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "image_data"
    t.index ["slug"], name: "index_profiles_on_slug", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "about_us"
    t.string   "slug"
    t.boolean  "auto_approve_comments", default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.text     "image_data"
    t.index ["slug"], name: "index_projects_on_slug", using: :btree
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "project_id",               null: false
    t.integer "user_id",                  null: false
    t.integer "project_role", default: 0
    t.index ["project_id", "user_id"], name: "index_projects_users_on_project_id_and_user_id", using: :btree
    t.index ["project_role"], name: "index_projects_users_on_project_role", using: :btree
    t.index ["user_id", "project_id"], name: "index_projects_users_on_user_id_and_project_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "contribution_images", "projects"
  add_foreign_key "contribution_images", "users"
  add_foreign_key "contribution_texts", "projects"
  add_foreign_key "contribution_texts", "users"
  add_foreign_key "profiles", "users"
end
