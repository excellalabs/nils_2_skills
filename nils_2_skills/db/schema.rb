# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150831203708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "development_plans", force: true do |t|
    t.string   "plan_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "development_plans_skills", force: true do |t|
    t.integer  "development_plan_id"
    t.integer  "development_skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "development_plans_skills", ["development_plan_id"], name: "index_development_plans_skills_on_development_plan_id", using: :btree
  add_index "development_plans_skills", ["development_skill_id"], name: "index_development_plans_skills_on_development_skill_id", using: :btree

  create_table "development_skills", force: true do |t|
    t.integer  "skill_id"
    t.string   "desired_skill_level"
    t.text     "notes"
    t.boolean  "completed"
    t.float    "percent_complete"
    t.string   "current_skill_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "development_plan_id"
    t.integer  "user_id"
  end

  add_index "development_skills", ["skill_id"], name: "index_development_skills_on_skill_id", using: :btree
  add_index "development_skills", ["user_id"], name: "index_development_skills_on_user_id", using: :btree

  create_table "development_tasks", force: true do |t|
    t.string   "task_name"
    t.text     "details"
    t.date     "start_date"
    t.date     "completion_date"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "development_skill_id"
  end

  add_index "development_tasks", ["development_skill_id"], name: "index_development_tasks_on_development_skill_id", using: :btree

  create_table "skill_categories", force: true do |t|
    t.string   "category_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_category_skills", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_levels", force: true do |t|
    t.string   "level"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "skill_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_category_id"
  end

  add_index "skills", ["skill_category_id"], name: "index_skills_on_skill_category_id", using: :btree

  create_table "skills_skill_categories", force: true do |t|
    t.integer  "skill_id"
    t.integer  "skill_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills_skill_categories", ["skill_category_id"], name: "index_skills_skill_categories_on_skill_category_id", using: :btree
  add_index "skills_skill_categories", ["skill_id"], name: "index_skills_skill_categories_on_skill_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
